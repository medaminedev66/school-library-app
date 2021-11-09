class Corrector
  def correct_name(name)
    @corrected_name = name[0].upcase << name[1..name.size - 1]
    @corrected_name = @corrected_name[0..10] if name.size > 10
    @corrected_name
  end
end
