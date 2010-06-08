# Author::        Eladio Ruiz  (mailto:eladioruiz@gmail.com)
# License::       Distributes under the same terms as Ruby
# Last revision:: 08/06/2010 by Eladio Ruiz
# Status::        Pending
# Comments::

class AuditSweeper < ActionController::Caching::Sweeper
  observe Course
  observe Match
  
  
  def after_create(record)
    log(record,"CREATE")
  end

  def after_update(record)
    log(record,"UPDATE")
  end

  def after_destroy(record)
    log(record,"DESTROY")
  end

  def log(record, event, user = 1)
    AuditTrail.create(:user_id => user, :controller => record.type.name, :action => event)
  end
end
