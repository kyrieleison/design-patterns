class Report
  def initialize
    @title = "TITLE"
    @text = ["text1", "text2"]
  end

  def output_report
    output_start
    output_head
    output_body
    output_end
  end
end

class HTMLReport < Report
  def output_start
    puts '<html>'
  end

  def output_head
    puts '<head>'
    puts "<title>#{@title}</title>"
    puts '</head>'
  end

  def output_body
    puts '<body>'
    @text.each do |t|
      puts "<p>#{t}</p>"
    end
    puts '</body>'
  end

  def output_end
    puts '</html>'
  end
end

class PlainTextReport < Report
  def output_start
  end
  
  def output_head
    puts @title
  end

  def output_body
    @text.each do |t|
      puts t
    end
  end

  def output_end
  end
end

report = HTMLReport.new
# report = PlainTextReport.new
report.output_report
