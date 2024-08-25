function B = sorted_ans(a)
    % made matrix with two same rows
    B = [a; a];
    
    % implementing bubble sort on first row
    for i = 1:1:length(a)
        for j = i+1:1:length(a)
            if B(1, j)>B(1,i)
                temp = B(1, i);
                B(1, i) = B(1, j);
                B(1, j) = temp;
            end
        end
    end
end


