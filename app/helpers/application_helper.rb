module ApplicationHelper
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
      current_number = page == current_page

      aria_label = @template.will_paginate_translate(
        :page_aria_label,
        page: page.to_i
      ) { ["Page", page].join(' ') }
      page_link = link(
        page,
        page,
        rel: rel_value(page),
        class: "page-link",
        "aria-label": aria_label
      )
      tag(
        :li,
        page_link,
        class: ["page-item", current_number ? "active" : nil ].join(' '),
        "aria-label": aria_label,
        "aria-current": current_number ? "page" : nil
      )
    end

    def html_container(html)
      tag(:dive, html, container_attributes.merge(class: "pagination"))
    end
  end
end
