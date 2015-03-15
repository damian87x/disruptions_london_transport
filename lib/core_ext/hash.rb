class Hash

  def test_so
    p 'ok!'
  end

  def rep_key(old,new)
    self[new] = self[old]
    self.delete old
  end


end