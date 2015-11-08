require "googleajax"
class BlogRoll < ActiveRecord::Base
  self.table_name = 'public.blog_rolls'
  has_many :blog_entries

  def self.harvest_new_entries()
    rollin = BlogRoll.where('active_flag = true')
    rollin.each do |roll|
      parse_feed_normal(roll[:feed_uri], roll[:id], Time.now - 3.days)
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

      # back fill the last 3 months
      parse_feed_normal(roll.feed_uri, roll.id, Time.now - 3.months)
  end


  def self.parse_feed_normal(feed_uri, blog_id, datefilter)
    GoogleAjax.referrer = "techlahoma.org"

    begin
        feedinfo = GoogleAjax::Feed.load(feed_uri)
        feedinfo[:entries].each do |info|

          if info[:published_date].to_date > datefilter
            entry_exists = BlogEntry.where("entry_uri = ?", info[:link]).select(:id).first

            unless entry_exists
              entry = BlogEntry.new
              entry.blog_roll_id = blog_id
              entry.title = info[:title]
              entry.entry_uri = info[:link]
              entry.posted_date = info[:published_date]
              entry.save
            end
          end # end date check
        end # end feed info loop
    end
  end
end
