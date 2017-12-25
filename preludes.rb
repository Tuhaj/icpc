class Preludes # https://icpc.baylor.edu/download/worldfinals/problems/2012-icpc-dress-rehearsal.pdf
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
    step = @key_note[-1] == '#' ? 1 : -1
    new_note_index = NOTES.find_index(@key_note[0]) + step
    @key_note[0] = NOTES[(new_note_index) % NOTES.size]
  end

  def alt_name
    return 'UNIQUE' unless has_accidental?
    change_note
    swap_accidental
    "#{@key_note} #{@tonality}"
  end
end
