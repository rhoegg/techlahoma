require "googleajax"
class BlogRoll < ActiveRecord::Base
  self.table_name = 'public.blog_rolls'
  has_many :blog_entries

  def self.harvest_new_entries()
    rollin = BlogRoll.where('active_flag = true')
    rollin.each do |r|
      parse_feed_normal(r[:feed_uri], r[:id], Time.now - 3.days)
    end
  end

  def self.create(title, author, uri, feed_uri, feed_type)
      roll = BlogRoll.new
      roll.title = title
      roll.author = author
      roll.blog_uri = uri
      roll.feed_uri = feed_uri
      roll.feed_type = feed_type
      roll.save

      #back fill the last 3 months
      parse_feed_normal(roll.feed_uri, roll.id, Time.now - 3.months)
  end


  def self.parse_feed_normal(feed_uri, blog_id, datefilter)
    GoogleAjax.referrer = "techlahoma.org"

    begin
        feedinfo = GoogleAjax::Feed.load(feed_uri)
        feedinfo[:entries].each do |c|

          if c[:published_date].to_date > datefilter
            toppy = BlogEntry.where("entry_uri = ?", c[:link]).select(:id).first

            if toppy.nil?
              entry = BlogEntry.new
              entry.blog_roll_id = blog_id
              entry.title = c[:title]
              entry.entry_uri = c[:link]
              entry.posted_date = c[:published_date]
              entry.save
            end
          end#end date check
        end #end feed info loop
    end
  end

end
=begin
BlogRoll.create('Jordan Rousseau', 'Jordan Rousseau', 'http://rousseau.io/', 'http://rousseau.io/atom.xml', 'atom' )
BlogRoll.create('Groove Coder', 'Luke Crouch', 'http://groovecoder.com/', 'http://groovecoder.com/feed/', 'feed' )
Luke Crouch - http://groovecoder.com/feed/
BlogRoll.create('Buddy Lindsey', 'Buddy Lindsey', 'http://buddylindsey.com/', 'http://buddylindsey.com/feed/', 'live' )


BlogRoll.create('Devin Clark', 'Devin Clark', 'http://devin-clark.com/', 'http://devin-clark.com/rss/', 'rss' )
BlogRoll.create('Jesse Harlin', 'Jesse Harlin', 'http://www.simiansblog.com/', 'http://www.simiansblog.com/rss?containerid=52', 'word' )
http://devin-clark.com/rss/
=end
