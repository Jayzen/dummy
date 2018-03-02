<div>
  <%= render 'errors' %>
  <%= form_for(@article,
                url: (@article.new_record? ? articles_path : article_path(@article)),
                method: (@article.new_record? ? 'post' : 'put')
              ) do |f| %>
    <div class="input-group mb-3">
      <%= f.text_field :title, class:"form-control", placeholder: "输入文章标题..." %>
    </div>
    <div class="form-group">
      <%= f.text_area :content, class:"form-control simplemde", rows: 15, placeholder: "输入文章正文..." %>
    </div>
    <%= hidden_field_tag :user_id, current_user.id %>
    
    <div class="d-flex flex-row row-hl">
      <div class="form-group item-hl mr-3">
        <label class="text-secondary">标签</label>
        <select name="article[category_id]", class="form-control text-secondary">
          <option></option>
          <option value="" selected disabled hidden>选择标签..</option>
          <% @root_categories.each do |category| %>
            <optgroup label="<%= category.name %>"></optgroup>
            <% category.subordinates.each do |sub_category| %>
              <option value="<%= sub_category.id %>" <%= @article.category_id == sub_category.id ? 'selected' : '' %>><%= sub_category.name %></option>
            <% end -%>
          <% end -%>
        </select>
      </div>
      <div class="form-group item-hl mr-3">
        <label class="text-secondary">状态:</label>
        <select name="product[status]"  class="form-control text-secondary">
          <% [[Article::Status::On, '发布'], [Article::Status::Off, '不发布']].each do |row| %>
            <option value="<%= row.first %>" <%= 'selected' if @article.status == row.first %>><%= row.last %></option>
          <% end -%>
        </select> 
      </div>

      <div class="form-group item-hl">
        <label>&nbsp </label>
        <%= f.submit @article.new_record? ? "保存文章" : "编辑文章", class: "form-control btn-primary"%>
      </div>
    </div>
  <% end -%>
</div>
<%= content_for :javascripts do %>
  <script>
    $(function () {
      document.querySelectorAll('.simplemde').forEach(function(editor) {
        var simplemde = new SimpleMDE({ 
          promptURLs: true,
          element: editor });

        inlineAttachment.editors.codemirror4.attach(simplemde.codemirror, {
          uploadUrl: '/pictures',
          extraHeaders: { 'X-CSRF-Token': Rails.csrfToken() }
        });
      });
    })
  </script>
<% end -%>
