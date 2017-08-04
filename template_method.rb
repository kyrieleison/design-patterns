class Report
  def initialize
    @title = "TITLE"
    @text = ["text1", "text2"]
  end

  def output_report(format)
    if format == :html
      puts '<html>'
      puts '<head>'
      puts "<title>#{@title}</title>"
      puts '</head>'
      puts '<body>'
      @text.each do |t|
        puts "<p>#{t}</p>"
      end
      puts '</body>'
      puts '</html>'
    else
      puts @title
      @text.each do |t|
        puts t
      end
    end
  end
end

report = Report.new
report.output_report(:html)
# report.output_report(:plain)
