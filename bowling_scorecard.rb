# X is a strike
# / is a spare
# 12 is 1 pin knocked down in the first roll of that frame and 2 pins knocked down in the second roll of that frame

def get_score (frames)
    # deal with case where score card is empty
    score = 0
    return score if frames.empty?

    # set multipliers to false
    apply_strike_multiplier = false
    apply_spare_multiplier = false

    # add all the frames together
    score = frames.reduce(0) { |sum, frame|
        if frame == "X"
            if apply_strike_multiplier
                sum += 20
            elsif apply_spare_multiplier
                sum += 20
            else
                sum += 10
            end
            apply_strike_multiplier = true
            sum
        elsif frame.include?("/")
            if apply_strike_multiplier
                sum += 20 
            elsif apply_spare_multiplier
                sum += frame[0].to_i + 10
            else
                sum += 10
            end
            apply_spare_multiplier = true
            sum
        else
            if apply_strike_multiplier   
                sum += frame.split("").sum { |roll|
                    roll.to_i
                } * 2
            elsif apply_spare_multiplier
                sum += frame[0].to_i * 2 + frame[1].to_i
            else
                sum += frame.split("").sum { |roll|
                    roll.to_i
                }
            end
            apply_strike_multiplier = false
            apply_spare_multiplier = false
            sum
        end
    }
    return score
end