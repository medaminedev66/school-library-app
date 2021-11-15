class Corrector
  def correct_name(name)
    @corrected_name = name.strip.capitalize
    @corrected_name = @corrected_name[0..10] if name.size > 10
    @corrected_name
  end
end
