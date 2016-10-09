


class XmlDocument

  # how much to indente each time:
  @@indent = "  "
  
  def initialize( pretty_print=false )
    @is_pretty = pretty_print
    @stack = []
  end

  # ==== tested API Methods ====
  def hello( attrs={}, &block)
    render_tag( "hello", attrs, &block)
  end

  def goodbye( attrs={}, &block)
    render_tag( "goodbye", attrs, &block)
  end

  def send( tag_name, attrs={}, &block)
    render_tag( tag_name, attrs, &block)
  end

  def come_back( attrs={}, &block)
    render_tag( "come_back", attrs, &block)
  end

  def ok_fine( attrs={}, &block)
    render_tag( "ok_fine", attrs, &block)
  end

  

  private
  def render_tag( tag_name, attrs, &block )
    #if name or block
    text = "<#{tag_name}"
    if attrs
      text += render_attributes(attrs)
    end
    if block
      if @is_pretty

        yieldtext = yield
        yieldtext = yieldtext.gsub(/\n/,"\n"+@@indent)
        yieldtext = @@indent + yieldtext[0...-2]

        text += ">\n"
        text += "#{yieldtext}"
        text += "</#{tag_name}>"
      else
        text += ">" + yield + "</#{tag_name}>"
      end
    else
      text += "/>"
    end

    text += "\n" if @is_pretty

    return text;
  end

  def render_attributes( dict)
    text = ""
    dict.each { |k,v|
      text += " #{k}='#{v}'"
    }
    return text;
  end


end


