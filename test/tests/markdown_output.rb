require_relative '../test'

class TestMarkdownOutput < Minitest::Test
  def setup
    @@report ||= Brakeman.run(
      :app_path       => "#{TEST_PATH}/apps/rails2",
      :quiet          => true,
      :run_all_checks => true
    ).report.to_markdown
  end

  def test_reported_warnings
    if Brakeman::Scanner::RUBY_1_9
      assert_equal 170, @@report.lines.to_a.count
    else
      assert_equal 171, @@report.lines.to_a.count
    end
  end
end
