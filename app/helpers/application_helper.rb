module ApplicationHelper
  def path_exists?(path, method: nil)
    if method
      Rails.application.routes.recognize_path(path, method: method)
    else
      Rails.application.routes.recognize_path(path)
    end
    true
  rescue ActionController::RoutingError
    false
  end

  def will_paginate(collection_or_options = nil, options = {})
    if collection_or_options.is_a? Hash
      options = collection_or_options
      collection_or_options = nil
    end
    unless options[:renderer]
      options = options.merge renderer: BootstrapLinkRenderer
    end
    super *[collection_or_options, options].compact
  end

  class BootstrapLinkRenderer < WillPaginate::ActionView::LinkRenderer
    protected

    def page_number(page)
      aria_label = @template.will_paginate_translate(:page_aria_label, page: page.to_i) { "Page #{page}" }
      page_link = link(page, page, rel: rel_value(page), class: "page-link", "aria-label": aria_label)

      if current?(page)
        tag(:li, page_link, class: "page-item active", "aria-label": aria_label, "aria-current": "page")
      else
        tag(:li, page_link, class: "page-item", "aria-label": aria_label)
      end
    end

    def html_container(html)
      tag(:dive, html, container_attributes.merge(class: "pagination"))
    end

    def current?(page)
      page == current_page
    end
  end
end
