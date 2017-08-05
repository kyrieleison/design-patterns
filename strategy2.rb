class Report
  attr_accessor :formatter
  attr_reader :title, :text

  def initialize(&formatter)
    @formatter = formatter
    @title = "TITLE"
    @text = ["text1", "text2"]
  end

  def output_report
    @formatter.call(self)
  end
end

HTML_FORMATTER = lambda do |context|
  puts '<html>'
  puts '<head>'
  puts "<title>#{context.title}</title>"
  puts '</head>'
  puts '<body>'
  context.text.each do |t|
    puts "<p>#{t}</p>"
  end
  puts '</body>'
end

PLAIN_TEXT_FORMATTER = lambda do |context|
  puts context.title
  context.text.each do |t|
    puts t
  end
end

report = Report.new(&HTML_FORMATTER)
# report = Report.new(&PLAIN_TEXT_FORMATTER)
# report = Report.new do |context|
#   puts context.title
# end
report.output_report
