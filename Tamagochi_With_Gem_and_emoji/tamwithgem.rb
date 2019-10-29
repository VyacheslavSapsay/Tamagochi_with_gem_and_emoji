require "TamGem.rb"

class Tomagochi

  @a = 0

  attr_accessor :type, :name, :hp, :hungry, :play, :mood, :sleep, :wallking, :training, :newday, :stats, :f


  def initialize(type, name, hp, hungry, mood, sleep, wallking, training, newday)
    @type = type
    @name = name
    @hp = hp
    @hungry = hungry
    @mood = mood
    @sleep = sleep
    @wallking = wallking
    @training = training
    @newday = newday
  end


  def status
    puts "______________________________________\n
Type: #{@type} \nName: #{@name} \nHp: #{@hp}/10 \nHungry: #{@hungry}/10 \nMood: #{@mood}/10 \nSleep: #{@sleep}/10 \nWallking: #{@wallking}/10 \nTraining: #{@training}/10
______________________________________"
  end

  def emoji
    f = File.new("emoji.html", "w")
    f.write "<!DOCTYPE html>"
    f.write "<html>"
    f.write "<head>"
    f.write "<title> Tamagochi emojies </title>"
    f.write "</head>"
    f.write "<body>"
    if @hp >= 8 && @hungry >= 8 && @mood >= 8 && @sleep >= 8 && @wallking >=8 && @training >= 8
      f.write '<h1 align="center">🥰</h1>'
    elsif @hp >= 5 && @hungry >= 5 && @mood >= 5 && @sleep >= 5 && @wallking >=5 && @training >= 5
      f.write '<h1 align="center">☺</h1>'
    elsif @hp < 5 && @hungry < 5 && @mood < 5 && @sleep < 5 && @wallking < 5 && @training < 5
      f.write '<h1 align="center">☹</h1>'
    elsif @hp <= 3 && @hungry <= 3 && @mood <= 3 && @sleep <= 3 && @wallking <= 3 && @training <= 3
      f.write '<h1 align="center">😧</h1>'
    elsif @hp <= 0 || @hungry <= 0 || @mood <= 0 || @sleep <= 0 || @wallking <= 0 || @training <= 0
      f.write '<h1 align="center">☠</h1>'
    end
    f.write "</body>"
    f.write "</html>"
    f.close
  end
  def checking
    if @hp > 10
      @hp = 10
    elsif @hungry > 10
      @hungry = 10
    elsif @mood >10
      @mood = 10
    elsif @sleep > 10
      @sleep = 10
    elsif @wallking > 10
      @wallking = 10
    elsif @training > 10
      @training = 10
    elsif @hp <= 0 || @hungry <= 0 || @mood <= 0 || @sleep <= 0 || @wallking <= 0 || @training <= 0
      puts "Your pet is die! \n Game over!!"
      @a += 1
    end
  end


  def hp
    @hp += 1
    @hungry -= 1
    @mood -= 1
    @sleep -= 1
    @wallking -= 1
    @training -= 1
  end

  def eating
    if @hungry <10
      @hungry += 1
      @mood += 1
      @sleep -= 1
      @wallking -=1
      @training -=1
    else
      puts "I'm not hungry"
    end
  end

  def play
    if @play < 10
      @play += 1
      @mood += 1
      @sleep -= 1
      @wallking -=1
    else
      puts "I don't want to play"
    end
  end

  def mood
    if @mood < 10
      @mood += 1
      @hungry -= 1
    else
      puts "I'm happy!!"
    end
  end

  def sleep
    if @sleep < 10
      @sleep += 1
      @mood += 1
      @hungry -= 1
      @wallking -= 1
      @training -= 1
    else
      puts "I don't want to sleep!"
    end
  end

  def wallking
    if @wallking < 10
      @wallking += 1
      @mood += 1
      @hungry -= 1
      @sleep -= 1
      @training -= 1
    else
      puts "I don't want to wallk"
    end
  end

  def training
    if @training < 10
      @training += 1
      @mood += 1
      @hungry -= 1
      @sleep -= 1
      @wallking -= 1
    else
      puts "I don't want to train"
    end
  end

  def tohtml
    @stats = "
Type: #{@type} \nName: #{@name} \nHp: #{@hp}/10 \nHungry: #{@hungry}/10 \nMood: #{@mood}/10 \nSleep: #{@sleep}/10 \nWallking: #{@wallking}/10 \nTraining: #{@training}/10"
  end

  private
  def newday
    @newday += 1
    emoji
    if @newday % 5 == 0
      puts "*****NEW DAY!!!******"
      @hp -= 1
      @hungry -= 1
      @mood -= 1
      @sleep -= 1
      @wallking -= 1
      @training -= 1
    elsif @newday % 20 == 0
      puts "Today was a nice day!"
      @hp += 1
      @hungry += 1
      @mood += 1
      @sleep += 1
      @wallking += 1
      @training += 1
    elsif @newday % 9 == 0
      puts "Today was a bad day!"
      @hp -= 1
      @hungry -= 1
      @mood -= 1
      @sleep -= 1
      @wallking -= 1
      @training -= 1
    elsif @newday % 50 == 0
      puts "I'M SO HAPPY!!"
      @hp += 1
      @hungry += 1
      @mood += 1
      @sleep += 1
      @wallking += 1
      @training += 1
    elsif @newday % 21 == 0
      puts "Today i learned new command!!"
      @training += 1
      @mood += 1
    elsif @newday % 15 == 0
      puts "****#{@name} show love to you!****"
    end
  end


end

@a = 0
puts "Hello. Now you wiil create your pet. \nChoose name:\n"
dogname = gets.chomp
pet = Tomagochi.new("Dog", dogname.capitalize, 10, 10, 10, 10, 10, 10, 1)
pet.emoji
puts "Great name - #{pet.name}"
while @a == 0
  pet.checking
  pet.send(:newday)
  petstats = pet.tohtml
  tamgem = TamagochiGem.new("prot.txt", petstats)
  tamgem.status
  #puts"\n\n\n\n\n\n\n\n\n"
  puts "***************"

  pet.status
  puts "1. Eat \n2. Play \n3. Sleep \n4. Wallk  \n5. Train \n6. Visit doctor\n7. Skip time \n8. Help\n0. Exit"
  puts "Enter a number!!"

  answer = gets.chomp.to_i
  pet.checking
  if answer == 1
    pet.eating
  elsif answer == 2
    pet.mood
  elsif answer == 3
    pet.sleep
  elsif answer == 4
    pet.wallking
  elsif answer == 5
    pet.training
  elsif answer == 6
    pet.hp
  elsif answer == 0
    @a = 1
  elsif answer == 7
    @newday = 3
  elsif answer == 8
    puts "Eat, Mood, Sleep, Wallk and Train scales will reduses with the time and with your actions. Hp scale reduses only with time"
    puts "\n1. When you choose 1(Eat) you feed your dog. It raises hes hungry and mood scale, but reduses sleep, wallk and train."
    puts "\n2. When you choose 2(Play) you play with your dog. It raises hes play and mood scale, but reduses sleep and wallk."
    puts "\n3. When you choose 3(Sleep) your dog will sleep. It raises hes sleep and mood scale, but reduses sleep, training and wallk."
    puts "\n4. When you choose 4(Wallk) you wallk with your dog. It raises hes Wallking and Mood scale, but reduses sleep, training and hungry"
    puts "\n5. When you choose 5(Train) you train your dog. It raises hes Training and Mood scale, but reduses Sleep, Training and Wallk"
    puts "\n6. When you choose 6(Visit doctor) you visit doctor for your dog. It raises hes hp scale, but reduses all another"
    puts "\n7. When you choose 7(Skip time) you just skip the time."
    puts "\n8. When you choose 0(exit) you will close the programm"
  else
    puts "Enter correct number"
  end
end
