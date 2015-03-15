module Extensions::ChangeNewParam


  def update_or_create(attributes)
    # binding.pry
    begin
      assign_or_new(attributes)
    rescue Exception => e
      puts "caught exception #{e}! Trace: #{e.backtrace}"
    end
  end

  def assign_or_new(attributes)
    attributes.rep_key('@id', 'uniq_id')
    attributes['CauseArea'].delete 'Streets'
    obj = first || new
    obj.assign_attributes(attributes)
    obj.save! && obj
  end


end