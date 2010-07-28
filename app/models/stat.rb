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

end
