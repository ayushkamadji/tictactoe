module KeyMap
  def keygen
    return ("A".."C").to_a.product((1..3).to_a)
  end

  def get_keys(keypart)
    return keygen().select {|keyset| keyset.any? {|elem| elem == keypart}}
  end

  def get_diag
    return [].push(("A".."C").to_a.zip((1..3).to_a)).push(("A".."C").to_a.zip((1..3).to_a.reverse))
  end
end
