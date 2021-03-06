class Stat 

  def self.strokes_average(pUserId)
    sql = "select user_id, avg(suma*(18/holes)) as media from vw_strokes_per_match where user_id=" + pUserId.to_s() + " group by user_id;"
    cs = Card.find_by_sql(sql)

    unless cs[0].nil?
      return cs[0].media
    else
      return 0
    end
  end

  def self.matches_average(pUserId)
    sql = "select user_id, avg(counter) as media from vw_matches_per_month where user_id=" + pUserId.to_s() + " group by user_id;"
    cs = Match.find_by_sql(sql)

    unless cs[0].nil?
      return cs[0].media
    else
      return 0
    end
  end

  def self.matches_last_month(pUserId)
    ordering = "date_hour_match DESC"
    limits = "100000000"
    matches = Match.my_matches(pUserId,ordering,limits,nil).last_month
    return matches.length
  end

  def self.num_matches(pUserId)
    return Player.find_all_by_user_id(pUserId).length
  end

  def self.regularity_strokes(pCourseId,pUserId)
    sql = "select strokes_total, matches.date_hour_match from cards inner join matches on cards.match_id=matches.id inner join players on matches.id=players.match_id  and cards.player_id=players.id where user_id=" + pUserId.to_s() + " and course_id=" + pCourseId.to_s() + " and matches.holes=18 order by matches.date_hour_match"
    cs = Card.find_by_sql(sql)

    return cs
  end

  def self.regularity_per_hole(pHoleId,pUserId)
    sql = "select strokes, matches.date_hour_match from card_strokes inner join cards on cards.id=card_strokes.card_id inner join players on cards.player_id=players.id inner join matches on (players.match_id=matches.id and cards.player_id=players.id) where user_id=" + pUserId.to_s() + " and hole_id=" + pHoleId.to_s() + " order by matches.date_hour_match"
    cs = Card.find_by_sql(sql)

    return cs
  end


end
