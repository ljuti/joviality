require "./word"

describe Word do
  let(:word)    { Word.new("Hääyöaie") }
  let(:koira)   { Word.new("koira") }
  let(:aurora)  { Word.new("Aurora") }

  describe "Extract vowels" do
    it "returns array of vowel sequences for a word" do
      expect(word.vowels).to eq ["ääyöaie"]
    end

    it "does the matching case-insensitively" do
      expect(aurora.vowels).to eq ["Au", "o", "a"]
    end
  end

  describe "Calculate Joviality Score" do
    it "calculates Joviality Score for the word" do
      expect(word.score).to eq 896
      expect(koira.score).to eq 10
      expect(aurora.score).to eq 12
    end
  end
end