class Api::SudokuController < ApplicationController
  def create
  	data = params[:data]
     if calculation(data,0,0)
     	render json:{solution: data}
     else	
        render json: {error: "invalid suduko"}
     end
  end


  def validation(data,row,col,num)
     for i in 0..9
	     	if data[row][i] == num
	          return false
	     	end	
	     for i in 0..9
		     	if data[i][col] == num
		          return false
		     	end	
	     end

     end
    start_row = row - row % 3
    start_col = col - col % 3

    for i in 0..3
    	for j in 0..3
         if data[i + start_row][j + start_col] == num
           return false        
         end  
    	end	
    end 
    return true
  end

  def calculation(data,row,col)
     n = 9
     
     if row == n-1 && col == n
       return true
     end
     if col == n 
     	row = row + 1
     	col = 0
     end	
  
     if !data[row][col].blank?
     	return calculation(data,row,col + 1)
     end
     	
     for num in 1..n
     	if validation(data,row,col,num)
     	  data[row][col] = num

	     	 if calculation(data,row,col + 1)
	     	 	return true
	     	 end	
      	end
     data[row][col]	= nil
     end 
      return false	
  end

	

end
