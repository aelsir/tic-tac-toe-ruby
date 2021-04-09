$stdout.sync = true

board = Array.new(3){Array.new(3)}

def initial_board(board) 
    for i in 0..2
        for j in 0..2
            print "| "
            print "* "
            board[i][j] = "*"
        end
        print "| "
        print "\n"
    end
end

def draw_board(board)
    for i in 0..2
        for j in 0..2
            print "| "
            print board[i][j] + " "
        end
        print "| "
        print "\n"
    end
end

def winning(board, player)

    for i in 0..1
        if board[i][0].eql?(player) && board[i][1].eql?(player) && board[i][2].eql?(player)
            return true
        elsif board[0][i].eql?(player) && board[1][i].eql?(player) && board[2][i].eql?(player)
            return true
        else
            return false
        end
    end
end


initial_board(board)

#the_X_team to assign which player going to start
the_X_team = true

while true 

    if the_X_team
        print "please enter your position as X player (ex: \"1,2\") "
    else 
        print "please enter your position as O player (ex: \"1,2\") "
    end
    
    game_move = gets
    game_positon = game_move.split(',')

    #printing either X, or O symbole
    raise IndexError if game_positon[0].to_i >= board.length
    rescue StandardError
        puts "you used invalid position"
    else 
        current_move = board[game_positon[0].to_i][game_positon[1].to_i]
        next
    end

    if current_move != "*"
        print "\n"
        puts "it's already equpied, try again!"
    else
        if the_X_team
            current_move.replace("X")
            if winning(board, "X")
                draw_board(board)
                print "Congradualtion X"
                break
            end
            the_X_team = false 
        else 
            current_move.replace("O")
            if winning(board, "O")
                draw_board(board)
                print "Congradualtion O"
                break
            end
            the_X_team = true
        end
    end


    draw_board(board)

end