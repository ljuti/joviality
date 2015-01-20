require "./joviality"

describe Joviality do
  let(:joviality) { Joviality.new }

  before do
    @file = File.open("alastalon_salissa.txt","r")
  end

  describe "Process text file" do
    it "processes supplied text file to words" do
      joviality.process(@file)
      expect(joviality.words.first).to be_kind_of Word
    end
  end

  describe "Scoring" do
    before do
      joviality.process(@file)
    end

    describe "Count the top score" do
      it "counts the top score" do
        expect(joviality.top_score).to eq 72
      end
    end

    describe "Find top words" do
      it "returns words with top scores" do
        expect(joviality.top_words.size).to eq 6
        joviality.top_words.each do |word|
          expect(%w{Leeaakaan liioittelematta niiaamaan seremoniioilla puuaineen seremoniioissa}).to include word
        end
      end
    end
  end
end