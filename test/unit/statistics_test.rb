require 'test_helper'

class StatisticsTest < ActiveSupport::TestCase
	test "the truth" do
		assert true
	end

	test "total articles returns a count of all the articles for the blog" do 
		Article.create title: "First", body: "Body"
		Article.create title: "First", body: "Body"

		stats = Statistics.new
		assert_equal 2, stats.total_articles
	end
end
