function extractStructFields(structA)
    % Extract all fields from the input structure and assign them to variables in the base workspace
    fields = fieldnames(structA);  % Get all field names of the struct
    for i = 1:length(fields)
        % Assign the field value to a variable with the same name in the base workspace
        assignin('base', fields{i}, structA.(fields{i}));
    end
end