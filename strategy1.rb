class Report
  attr_accessor :formatter
  attr_reader :title, :text

  def initialize(formatter)
    @formatter = formatter
    @title = "TITLE"
    @text = ["text1", "text2"]
  end

  def output_report
    @formatter.output_report(self)
  end
end

class HTMLReportFormatter
  class << self
    def output_report(context)
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
  end
end

class PlainTextReportFormatter
  class << self
    def output_report(context)
      puts context.title
      context.text.each do |t|
        puts t
      end
    end
  end
end

report = Report.new(HTMLReportFormatter)
# report = Report.new(PlainTextReportFormatter)
report.output_report

# report.formatter = PlainTextReportFormatter
# report.output_report
