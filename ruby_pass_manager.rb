# const should use uppercase
# EMAIL = "ojan@mail.com"
# PASSWORD = "admin"
USER_VAULT = {ojan: {email: "ojan@mail.com", password:"admin"}, example: {email: "example@mail.com", password: "admin"}}

# print welcome message (puts create new line)
puts "Welcome to Latihan Ruby - Password Manager" 
puts "Please sign in to continue."

# print doesnt create new line
print "Enter email: "

# gets for capturing user input in terminal - (ex in jscript: process.argv)
user_email = gets.chomp #chomp same like trim in js

# executed after user input
#p user_email

###################

#check user email (if elsif else)
# if user_email === EMAIL #ngecek normal pake gini, sekarang mau nyoba cek jika dia di dalem hash (objek)

###################

#nyoba ngecek value based on key
checkEmail = USER_VAULT
username = ""
flag = 0;

checkEmail.each do |key, value|
    if value[:email] == user_email
        flag = 1
        username = key
        break
    end #end of if
end #end of checkEmail

if flag != 0
    p "Enter password: "
    user_password = gets.chomp #chomp same like trim in js
    # example condition:
    # if user_password === PASSWORD
    #     p "Login successful"
    # else
    #     p "Wrong password"
    # end
else
    puts "Email is incorrect"
    exit #exit the program
end #end of if else

loop do

# alternative condition for password:
unless user_password != USER_VAULT[username][:password] #unless itu kondisinya kebalikan if
    puts "\n\nHello, #{user_email}." #ini seperti ` ${user_email}` in js
    puts "Menu: "
    puts "1. Add new user"
    puts "2. List users"
    puts "3. Specific users"
    puts "4. Exit"
    user_selection = gets.chomp
else
    puts "invalid password"
    exit
end


#swicth case in ruby:

case user_selection
when "1"
    puts "this will create a new user"
    print "Enter new user name: "
    new_user_email = gets.chomp 
    new_user_name = new_user_email.split("@")[0]
    print "Enter new user password: "
    new_user_password = gets.chomp 
    USER_VAULT[new_user_name] = {}
    USER_VAULT[new_user_name]["email"] = new_user_email
    USER_VAULT[new_user_name]["password"] = new_user_password
    p USER_VAULT[new_user_name]
when "2"
    puts "this will list all users"
    # p USER_VAULT.keys #ini print langsung bentuk objek mentah

    listUsers = USER_VAULT #tampung dulu di listUsers

    # looping every user in uservault
    listUsers.each do |key, value|
        puts "#{key}:"
        listUsers[key].each do |k,v|
        puts "#{k}: #{v}"
        end
    end
when "3"
    puts "this will show specific users"
    print "Enter user name: "
    requested_user_name = gets.chomp

    # p USER_VAULT[requested_user_name.to_sym] #karena nama key yg example@mail.com bukan string

    user = USER_VAULT[requested_user_name.to_sym] #ditampung
    
    #validasi jika user yang dicari tidak ada
    if user.nil?
        puts "user not found"
        exit
    end
    
    puts "Here are the details of #{requested_user_name}:"
    
    # looping tiap key pada specific user 
    user.each do |key, value|
    puts "#{key}: #{value}"
    end
else #default case in swithc case

    #coba bkin ternary
    print "are you sure you want to exit? (y/n): "
    user_selection_exit = gets.chomp
    puts user_selection_exit == "y" ?   "Exiting program" : "You are not exiting the program"
    user_selection_exit == "y"? exit : ""
end 

end #end of do