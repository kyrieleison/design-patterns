class Report
  def initialize(formatter)
    @formatter = formatter
    @title = "TITLE"
    @text = ["text1", "text2"]
  end

  def output_report
    @formatter.output_report(@title, @text)
  end
end

class HTMLReportFormatter
  class << self
    def output_report(title, text)
      puts '<html>'
      puts '<head>'
      puts "<title>#{title}</title>"
      puts '</head>'
      puts '<body>'
      text.each do |t|
        puts "<p>#{t}</p>"
      end
      puts '</body>'
    end
  end
end

class PlainTextReportFormatter
  class << self
    def output_report(title, text)
      puts title
      text.each do |t|
        puts t
      end
    end
  end
end

report = Report.new(HTMLReportFormatter)
# report = Report.new(PlainTextReportFormatter)
report.output_report
