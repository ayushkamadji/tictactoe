module GameHelper
  def parse(movecode)
    keyarray = movecode.split("")
    keyarray[1] = keyarray[1].to_i
    return keyarray
  end
end
