require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
<<<<<<< HEAD
    doc = Nokogiri::HTML(open(index_url))
    students = doc.css('div.student-card')
    students.map do |student|
    {name: student.css('h4.student-name').text,
      location: student.css('p.student-location').text,
      profile_url: student.css('a').first['href']}
=======
    doc = Nokogiri::HTML(open("https://learn-co-curriculum.github.io/student-scraper-test-page/"))
    students = doc.css('div.student-card')
    students.map do |student|
      student_link = student.css('a').first['href']
      profile_url = "https://learn-co-curriculum.github.io/student-scraper-test-page/#{student_link}"
      self.scrape_profile_page(profile_url)
>>>>>>> 9a489f80adfec659c1b86f995504a14e4a5ec59c
    end
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
<<<<<<< HEAD
    student = {}
    links = doc.css(".social-icon-container").children.css("a").map { |el| el.attribute('href').value}
    links.each do |link|
      if link.include?("twitter")
        student[:twitter] = link
      elsif link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      else
        student[:blog] = link
      end
    end
    student[:profile_quote] = doc.css('div.profile-quote').text
    student[:bio] = doc.css('div.description-holder p').text
    student
=======
    {name: doc.css('h1.profile-name').text,
    location: doc.css('h2.profile-location').text,
    profile_url: profile_url}
>>>>>>> 9a489f80adfec659c1b86f995504a14e4a5ec59c
  end

end
