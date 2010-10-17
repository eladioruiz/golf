# To change this template, choose Tools | Templates
# and open the template in the editor.

class UploadMatch
  attr_accessor :match_id
  attr_accessor :date_hour
  attr_accessor :holes
  attr_accessor :course_id
  attr_accessor :filename
  attr_accessor :code
  attr_accessor :error

  def initialize
    @error = ""
  end

  def save(filename,data)
    directory = "public/Data/android/"
    name      = filename
    # create the file path
    @filename = File.join(directory, name)
    # write the file
    File.open(@filename, "wb") { |f| f.write(data) }
  end


  def parseMatch
    @match_id = "0"
    
    unless @filename.nil?
#      @xml_code = Nokogiri::XML(File.new(filename))
#      code = @xml_code
#      course_id = @xml_code.root.xpath(".//course_id")
#      date_hour = @xml_code.root.xpath(".//date_hour")
#      holes = @xml_code.root.xpath(".//holes")
#
#      @players = @xml_code.root.xpath(".//players")

      @xml_code = Hash.from_xml(File.new(@filename))
      @code = @xml_code

      @match = @xml_code["match"] # RAIZ /ROOT
      @course_id = @match["course_id"]
      @holes = @match["holes"]
      @date_hour = @match["date_hour"]

      # CREATING MATCH
      @new_match = Match.new
      @new_match.course_id = @course_id
      @new_match.date_hour_match = @date_hour
      @new_match.holes = @holes
      @new_match.enabled = 1
      if @new_match.save

        @match_id = @new_match.id
        
        # CREATING PLAYERS
        @players = @match["players"]["player"] # ROOT PLAYERS

        # CREATING PLAYERS
        @players.each do |player|
          @user_id = player["user_id"]
          @tee_id  = player["tee_id"]

          @user = User.find(@user_id)
          @handicap = 0
          @handicap = @user.handicap unless @user.nil?

          pl = Player.new
          pl.user_id  = @user_id
          pl.tee_id   = @tee_id
          pl.handicap = @handicap
          pl.match_id = @match_id
          if pl.save
            # CREATING CARD

            @player_id = pl.id

            @card = Card.new
            @card.match_id  = @match_id
            @card.player_id = @player_id
            if @card.save
              # CREATING STROKES

              @holes = player["hole"]
              @holes.each_with_index do |strokes, hole_number|
                @hole = Hole.find_like_by_number(@course_id,(hole_number+1).to_s)[0]
                @card.add_strokes_per_hole(@hole.id, strokes, 0) unless @hole.nil?
              end
              @card.recalculate_strokes

            end
          end
        end
      end
    end
  end

end
