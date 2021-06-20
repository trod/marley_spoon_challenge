defmodule MarleySpoon.Fixtures.Recipe do
  @moduledoc """
  recipe fixtures
  """

  def recipes do
    {:ok,
     [
       %Contentful.Entry{
         assets: [
           %Contentful.Asset{
             fields: %Contentful.Asset.Fields{
               description: nil,
               file: %{
                 content_type: "image/jpeg",
                 details: %{
                   "image" => %{"height" => 680, "width" => 1020},
                   "size" => 194_737
                 },
                 file_name: "SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
                 url: %URI{
                   authority: "images.ctfassets.net",
                   fragment: nil,
                   host: "images.ctfassets.net",
                   path:
                     "/kk2bw5ojx476/61XHcqOBFYAYCGsKugoMYK/0009ec560684b37f7f7abadd66680179/SKU1240_hero-374f8cece3c71f5fcdc939039e00fb96.jpg",
                   port: nil,
                   query: nil,
                   scheme: nil,
                   userinfo: nil
                 }
               },
               title: "SKU1240 hero-374f8cece3c71f5fcdc939039e00fb96"
             },
             sys: %Contentful.SysData{
               content_type: nil,
               created_at: "2018-05-07T13:37:53.784Z",
               id: "61XHcqOBFYAYCGsKugoMYK",
               locale: "en-US",
               revision: 1,
               updated_at: "2018-05-07T13:37:53.784Z",
               version: nil
             }
           }
         ],
         fields: %{
           "calories" => 788,
           "description" =>
             "*Grilled Cheese 101*: Use delicious cheese and good quality bread; make crunchy on the outside and ooey gooey on the inside; add one or two ingredients for a flavor punch! In this case, cherry preserves serve as a sweet contrast to cheddar cheese, and basil adds a light, refreshing note. Use __mayonnaise__ on the outside of the bread to achieve the ultimate, crispy, golden-brown __grilled cheese__. Cook, relax, and enjoy!",
           "photo" => %{
             "sys" => %{
               "id" => "61XHcqOBFYAYCGsKugoMYK",
               "linkType" => "Asset",
               "type" => "Link"
             }
           },
           "tags" => [
             %{
               "sys" => %{
                 "id" => "3RvdyqS8408uQQkkeyi26k",
                 "linkType" => "Entry",
                 "type" => "Link"
               }
             }
           ],
           "title" => "White Cheddar Grilled Cheese with Cherry Preserves & Basil"
         },
         sys: %Contentful.SysData{
           content_type: %Contentful.ContentType{
             description: nil,
             display_field: nil,
             fields: [],
             id: "recipe",
             name: nil,
             sys: %Contentful.SysData{
               content_type: nil,
               created_at: nil,
               id: nil,
               locale: nil,
               revision: nil,
               updated_at: nil,
               version: nil
             }
           },
           created_at: "2018-05-07T13:38:22.351Z",
           id: "4dT8tcb6ukGSIg2YyuGEOm",
           locale: "en-US",
           revision: 2,
           updated_at: "2018-05-07T13:41:01.986Z",
           version: nil
         }
       },
       %Contentful.Entry{
         assets: [
           %Contentful.Asset{
             fields: %Contentful.Asset.Fields{
               description: nil,
               file: %{
                 content_type: "image/jpeg",
                 details: %{
                   "image" => %{"height" => 680, "width" => 1020},
                   "size" => 218_803
                 },
                 file_name: "SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg",
                 url: %URI{
                   authority: "images.ctfassets.net",
                   fragment: nil,
                   host: "images.ctfassets.net",
                   path:
                     "/kk2bw5ojx476/48S44TRZN626y4Wy4CuOmA/9c0a510bc3d18dda9318c6bf49fac327/SKU1498_Hero_154__2_-adb6124909b48c69f869afecb78b6808-2.jpg",
                   port: nil,
                   query: nil,
                   scheme: nil,
                   userinfo: nil
                 }
               },
               title: "SKU1498 Hero 154 2 -adb6124909b48c69f869afecb78b6808-2"
             },
             sys: %Contentful.SysData{
               content_type: nil,
               created_at: "2018-05-07T13:39:06.171Z",
               id: "48S44TRZN626y4Wy4CuOmA",
               locale: "en-US",
               revision: 1,
               updated_at: "2018-05-07T13:39:06.171Z",
               version: nil
             }
           }
         ],
         fields: %{
           "calories" => 900,
           "description" =>
             "Saag paneer is a popular Indian dish with iron-rich spinach and cubes of paneer, an Indian cheese that is firm enough to retain it's shape, but silky-soft on the inside. We have reimagined Saag Paneer and replaced the \"paneer\" with crispy cubes of firm tofu, making this already delicious and nutritious vegetarian dish burst with protein. Toasted pita bread is served alongside as an ode to naan. Cook, relax, and enjoy! [VIDEO](https://www.youtube.com/watch?v=RMzWWwfWdVs)",
           "photo" => %{
             "sys" => %{
               "id" => "48S44TRZN626y4Wy4CuOmA",
               "linkType" => "Asset",
               "type" => "Link"
             }
           },
           "title" => "Tofu Saag Paneer with Buttery Toasted Pita"
         },
         sys: %Contentful.SysData{
           content_type: %Contentful.ContentType{
             description: nil,
             display_field: nil,
             fields: [],
             id: "recipe",
             name: nil,
             sys: %Contentful.SysData{
               content_type: nil,
               created_at: nil,
               id: nil,
               locale: nil,
               revision: nil,
               updated_at: nil,
               version: nil
             }
           },
           created_at: "2018-05-07T13:40:27.932Z",
           id: "5jy9hcMeEgQ4maKGqIOYW6",
           locale: "en-US",
           revision: 1,
           updated_at: "2018-05-07T13:40:27.932Z",
           version: nil
         }
       },
       %Contentful.Entry{
         assets: [
           %Contentful.Asset{
             fields: %Contentful.Asset.Fields{
               description: nil,
               file: %{
                 content_type: "image/jpeg",
                 details: %{
                   "image" => %{"height" => 680, "width" => 1020},
                   "size" => 216_391
                 },
                 file_name: "SKU1503_Hero_102__1_-6add52eb4eec83f785974ddeac3316b7.jpg",
                 url: %URI{
                   authority: "images.ctfassets.net",
                   fragment: nil,
                   host: "images.ctfassets.net",
                   path:
                     "/kk2bw5ojx476/3TJp6aDAcMw6yMiE82Oy0K/2a4cde3c1c7e374166dcce1e900cb3c1/SKU1503_Hero_102__1_-6add52eb4eec83f785974ddeac3316b7.jpg",
                   port: nil,
                   query: nil,
                   scheme: nil,
                   userinfo: nil
                 }
               },
               title: "SKU1503 Hero 102 1 -6add52eb4eec83f785974ddeac3316b7"
             },
             sys: %Contentful.SysData{
               content_type: nil,
               created_at: "2018-05-07T13:30:06.967Z",
               id: "3TJp6aDAcMw6yMiE82Oy0K",
               locale: "en-US",
               revision: 1,
               updated_at: "2018-05-07T13:30:06.967Z",
               version: nil
             }
           }
         ],
         fields: %{
           "calories" => 345,
           "chef" => %{
             "sys" => %{
               "id" => "1Z8SwWMmS8E84Iogk4E6ik",
               "linkType" => "Entry",
               "type" => "Link"
             }
           },
           "description" =>
             "Warmer weather means the ushering in of grill season and this recipe completely celebrates the grill (or grill pan)! Squash and green beans are nicely charred then take a bath in a zesty cilantro-jalapeño dressing. After the steaks are perfectly seared, the same dressing does double duty as a tasty finishing sauce. A fresh radish salad tops it all off for crunch and a burst of color. Cook, relax, and enjoy!",
           "photo" => %{
             "sys" => %{
               "id" => "3TJp6aDAcMw6yMiE82Oy0K",
               "linkType" => "Asset",
               "type" => "Link"
             }
           },
           "title" => "Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing"
         },
         sys: %Contentful.SysData{
           content_type: %Contentful.ContentType{
             description: nil,
             display_field: nil,
             fields: [],
             id: "recipe",
             name: nil,
             sys: %Contentful.SysData{
               content_type: nil,
               created_at: nil,
               id: nil,
               locale: nil,
               revision: nil,
               updated_at: nil,
               version: nil
             }
           },
           created_at: "2018-05-07T13:30:34.066Z",
           id: "2E8bc3VcJmA8OgmQsageas",
           locale: "en-US",
           revision: 3,
           updated_at: "2018-05-07T13:37:01.760Z",
           version: nil
         }
       },
       %Contentful.Entry{
         assets: [
           %Contentful.Asset{
             fields: %Contentful.Asset.Fields{
               description: nil,
               file: %{
                 content_type: "image/jpeg",
                 details: %{
                   "image" => %{"height" => 680, "width" => 1020},
                   "size" => 230_068
                 },
                 file_name: "SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg",
                 url: %URI{
                   authority: "images.ctfassets.net",
                   fragment: nil,
                   host: "images.ctfassets.net",
                   path:
                     "/kk2bw5ojx476/5mFyTozvSoyE0Mqseoos86/fb88f4302cfd184492e548cde11a2555/SKU1479_Hero_077-71d8a07ff8e79abcb0e6c0ebf0f3b69c.jpg",
                   port: nil,
                   query: nil,
                   scheme: nil,
                   userinfo: nil
                 }
               },
               title: "SKU1479 Hero 077-71d8a07ff8e79abcb0e6c0ebf0f3b69c"
             },
             sys: %Contentful.SysData{
               content_type: nil,
               created_at: "2018-05-07T13:31:45.501Z",
               id: "5mFyTozvSoyE0Mqseoos86",
               locale: "en-US",
               revision: 1,
               updated_at: "2018-05-07T13:31:45.501Z",
               version: nil
             }
           }
         ],
         fields: %{
           "calories" => 785,
           "chef" => %{
             "sys" => %{
               "id" => "NysGB8obcaQWmq0aQ6qkC",
               "linkType" => "Entry",
               "type" => "Link"
             }
           },
           "description" =>
             "Crispy chicken skin, tender meat, and rich, tomatoey sauce form a winning trifecta of delicious in this one-pot braise. We spoon it over rice and peas to soak up every last drop of goodness, and serve a tangy arugula salad alongside for a vibrant boost of flavor and color. Dinner is served! Cook, relax, and enjoy!",
           "photo" => %{
             "sys" => %{
               "id" => "5mFyTozvSoyE0Mqseoos86",
               "linkType" => "Asset",
               "type" => "Link"
             }
           },
           "tags" => [
             %{
               "sys" => %{
                 "id" => "61Lgvo6rzUIgIGgcOAMgQ8",
                 "linkType" => "Entry",
                 "type" => "Link"
               }
             },
             %{
               "sys" => %{
                 "id" => "gUfhl28dfaeU6wcWSqs0q",
                 "linkType" => "Entry",
                 "type" => "Link"
               }
             }
           ],
           "title" => "Crispy Chicken and Rice\twith Peas & Arugula Salad"
         },
         sys: %Contentful.SysData{
           content_type: %Contentful.ContentType{
             description: nil,
             display_field: nil,
             fields: [],
             id: "recipe",
             name: nil,
             sys: %Contentful.SysData{
               content_type: nil,
               created_at: nil,
               id: nil,
               locale: nil,
               revision: nil,
               updated_at: nil,
               version: nil
             }
           },
           created_at: "2018-05-07T13:32:04.593Z",
           id: "437eO3ORCME46i02SeCW46",
           locale: "en-US",
           revision: 3,
           updated_at: "2018-05-07T13:36:41.741Z",
           version: nil
         }
       }
     ], [total: 4]}
  end
end
