module Extensions::ChangeNewParam


  def update_or_create(attributes)
    begin
      assign_or_new(attributes)
    rescue Exception => e
      puts "caught exception #{e}! Trace: #{e.backtrace}"
    end
  end

  def assign_or_new(attributes)
    obj = first || new
    obj.assign_attributes(attributes)
    obj.save && obj
  end


end