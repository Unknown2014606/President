Rails.application.routes.draw do
get 'welcome/index'
post 'admin/login', to: 'admin#login'
get 'admin/logout', to: 'admin#logout'
get 'admin/home', to:'admin#admin'
get 'admin/president_new', to: 'admin#president_new'
post 'admin/president_add', to: 'admin#president_add'
get 'admin/president_edit/:id', to: 'admin#president_edit', as: 'admin_president_edit'
patch 'admin/president_update/:id', to: 'admin#president_update', as: 'admin_president_update'
get 'admin/president_view/:id', to: 'admin#president_view', as: 'admin_president'
delete 'admin/president_delete/:id', to: 'admin#president_delete', as: 'admin_president_delete'
get 'admin/president_list', to: 'admin#president_list'
get 'admin/video_new', to: 'admin#video_new'
post 'admin/video_add', to: 'admin#video_add'
get 'admin/video_edit/:id', to: 'admin#video_edit', as: 'admin_video_edit'
patch 'admin/video_update/:id', to: 'admin#video_update', as: 'admin_video_update'
get 'admin/video_view/:id', to: 'admin#video_view', as: 'admin_video'
delete 'admin/video_delete/:id', to: 'admin#video_delete', as: 'admin_video_delete'
get 'admin/video_list', to: 'admin#video_list'
delete 'admin/comment_delete/:id', to: 'admin#comment_delete', as: 'admin_comment_delete'
get 'video_view/:id', to: 'video#video_view', as: 'video'
get 'video_view/:id1/:id2', to: 'video#video_view2', as: 'video2'
post 'video/comment_add1/:id1/:id2', to: 'video#comment_add1', as: 'comment_add1'
post 'video/comment_add2/:id1/:id2', to: 'video#comment_add2', as: 'comment_add2'
get 'video/:video_id/comment', to: 'video#comment_list', as: 'comment_list'
post 'video/:video_id/comment_add', to: 'video#comment_add', as: 'comment_add'
post 'welcome/get_options', to: 'welcome#get_options'
# The priority is based upon order of creation: first created -> highest priority.
# See how all your routes lay out with "rake routes".
# You can have the root of your site routed with "root"
root 'welcome#index', as: 'welcome'
# Example of regular route:
# get 'products/:id' => 'catalog#view'
# Example of named route that can be invoked with purchase_url(id: product.id)
# get 'products/:id/purchase' => 'catalog#purchase', as: :purchase
# Example resource route (maps HTTP verbs to controller actions automatically):
# resources :products
# Example resource route with options:
# resources :products do
# member do
# get 'short'
# post 'toggle'
# end
#
# collection do
# get 'sold'
# end
# end
# Example resource route with sub-resources:
# resources :products do
# resources :comments, :sales
# resource :seller
# end
# Example resource route with more complex sub-resources:
# resources :products do
# resources :comments
# resources :sales do
# get 'recent', on: :collection
# end
# end
# Example resource route with concerns:
# concern :toggleable do
# post 'toggle'
# end
# resources :posts, concerns: :toggleable
# resources :photos, concerns: :toggleable
# Example resource route within a namespace:
# namespace :admin do
# # Directs /admin/products/* to Admin::ProductsController
# # (app/controllers/admin/products_controller.rb)
# resources :products
# end
end
