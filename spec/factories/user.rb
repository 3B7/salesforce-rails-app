# provider: "google_oauth2", uid: "100835430570043954800", name: "Erik B", 
# email: "erikbatres@gmail.com", refresh_token: nil, access_token: "ya29.MQLBbP-UMkywiLAsc0jL_2p_yhDmWvFZgp8sRTLB7ggIyu...", 
# salesforce_producer_id: nil, image: "https://lh4.googleusercontent.com/-79zfDpyP_GI/AAAA...", 
# expires: 1447965370, last_request_at: "2015-11-19 19:36:11", authorized: false, 
# ip_address: "127.0.0.1", created_at: "2015-11-19 19:36:11", updated_at: "2015-11-19 19:36:11">

FactoryGirl.define do
  factory :user do
    provider "google_oauth2"
    uid "123"
    name "Darth Vader"
    email "test@gasvaluation.com"
    ip_address "127.0.0.1"
    authorized true
  end
end