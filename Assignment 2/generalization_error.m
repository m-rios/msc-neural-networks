function [ e ] = generalization_error( teacher, student )
    e = 1/pi * acos(dot(student, teacher)/(norm(student)*norm(teacher)));
end

