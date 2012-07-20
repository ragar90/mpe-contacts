# encoding: utf-8  
module ApplicationHelper
	def mark_required(object, attribute)
    "*" if object.class.validators_on(attribute).map(&:class).include? ActiveModel::Validations::PresenceValidator
  end
  
  def error_messages!(resource)
    return "" if resource.errors.messages.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML   
    <div class= "alert alert-error fade in">       
      <a class="close" data-dismiss="alert" href="#">×</a> 
      <h2>#{sentence}</h2>
      <ul>#{messages}</ul>  
    </div>
    HTML

    html.html_safe
  end
   
  def flash_alerts(name,msg)        
    alert_type=case name
                when :warning then "alert"
                when :success  then "alert alert-success"  
                when :notice  then "alert alert-success"
                when :error   then "alert alert-error"
                when :alert   then "alert alert-error"
                else "alert"  
               end
    html = <<-HTML                                                                                                     
    <div class="#{alert_type}">
      <center>#{msg}</center>
    </div>
    HTML
    
    html.html_safe
  end            
end
