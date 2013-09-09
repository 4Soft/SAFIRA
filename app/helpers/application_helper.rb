# -*- encoding : utf-8 -*-
module ApplicationHelper
  
  def gravatar_for(user, size=80)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    image_tag(gravatar_url, alt: user.name, class: "gravatar")
  end

  def gravatar_url(user, size=240)
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}?s=#{size}"
    gravatar_url
  end

  def dropbox_url
    "https://dl.dropboxusercontent.com/1/view/4gxc18060sn2cet/Apps/4SIG/"
  end

  def curriculum_url(candidate)
    selection_process = candidate.selection_process
    "#{dropbox_url}#{selection_process.enterprise.name}/#{selection_process.full_name}/curriculos/#{candidate.name.capitalize}-#{candidate.email}.pdf"
  end

  def edict_url(selection_process)
    enterprise = selection_process.enterprise
    "#{dropbox_url}#{enterprise.name}/#{selection_process.name}/edital/#{selection_process.edict_file_name}"
  end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, ("add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")"))
  end

  def link_to_remove_fields(name, f)
    link_to_function(name, "remove_fields(this)")
  end

  def post_date(date)
    date.strftime("%d/%m/%Y")
  end

end
