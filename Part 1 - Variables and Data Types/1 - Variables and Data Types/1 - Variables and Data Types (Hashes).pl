#Hash 1
%food = ('cookies', 3, 'ice cream', 6); #key cookie has value 3. key ice cream has value 6.

#Hash 2 (the better way)
%food = (
    'cookies' => 3, 
    'ice cream' => 6

); 

#Accesing values in a hash
%grades = (
    "ELA" => "A-",
    "Math" => "B+",
    "History" => "B-",
    "Science" => "C+"
);

print $grades{"History"} . "\n"; #Output: B-
$grades{"Math"} = "A+"; #changing my math grade to an A+
print %grades{"Math"} . "\n"; #Output: A+