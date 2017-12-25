class Preludes

  def initialize(key)
    @key = key
    key_parts = @key.split(' ')
    @key_note = key_parts[0]
    @tonality = key_parts[1]
  end

  NOTES = ['A', 'B', 'C', 'D', 'E', 'F', 'G']

  INVERSE_ACCIDENTALS = {
    '#' => 'b',
    'b' => '#'
  }

  def has_accidental?
    INVERSE_ACCIDENTALS.keys.include?(@key_note[-1])
  end

  def swap_accidental
    @key_note[-1] = INVERSE_ACCIDENTALS[@key_note[-1]]
  end

  def change_note
    if @key_note[-1] == '#'
      step = 1
    else
      step = -1
    end
    new_note_index = NOTES.find_index(@key_note[0]) + step
    @key_note[0] = NOTES[(new_note_index) % NOTES.size]
  end

  def alt_name
    if has_accidental?
      change_note
      swap_accidental
      "#{@key_note} #{@tonality}"
    else
      'UNIQUE'
    end
  end
end
