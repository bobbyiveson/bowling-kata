require_relative '../bowling_scorecard'

describe 'bowling scorecard' do
    it 'returns 0 when score card is empty' do
        expect(get_score([])).to eq(0)
    end

    describe 'with 1 frame' do
        it 'returns 1 when score card is [1]' do
            expect(get_score(["1"])).to eq(1)
        end

        it 'returns 2 when score card is [11]' do
            expect(get_score(["11"])).to eq(2)
        end

        it 'returns 10 when score card is [X]' do
            expect(get_score(["X"])).to eq(10)
        end

        it 'returns 10 when score card is [2/]' do
            expect(get_score(["2/"])).to eq(10)
        end
    end

    describe 'with 2 frames' do
        it 'returns 3 when score card is [11, 10]' do
            expect(get_score(["11", "10"])).to eq(3)
        end
    
        it 'returns 4 when score card is [11, 11]' do
            expect(get_score(["11", "11"])).to eq(4)
        end

        it 'returns 16 when score card is [X, 12]' do
            expect(get_score(["X", "12"])).to eq(16)
        end
        
        it 'returns 12 when score card is [2/, 12]' do
            expect(get_score(["2/", "12"])).to eq(14)
        end

        it 'returns 30 when score card is [X, X]' do
            expect(get_score(["X", "X"])).to eq(30)
        end

        it 'returns 21 when score card is [2/, 1/]' do
            expect(get_score(["2/", "1/"])).to eq(21)
        end

        it 'returns 30 when score card is [X, 1/]' do
            expect(get_score(["X", "1/"])).to eq(30)
        end
    end

    describe 'with 3 frames' do
        it 'returns 50 when score card is [X, X, X]' do
            expect(get_score(["X", "X", "X"])).to eq(50)
        end

        it 'returns 32 when score card is [2/, 1/, 1/]' do
            expect(get_score(["2/", "1/", "1/"])).to eq(32)
        end

        it 'returns 30 when score card is [X, X]' do
            expect(get_score(["X", "X"])).to eq(30)
        end

        it 'returns 30 when score card is [X, 23, X]' do
            expect(get_score(["X", "23", "X"])).to eq(30)
        end
    end
end