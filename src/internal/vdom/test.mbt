// test {
//   let node1 = {
//     tag: "div",
//     attrs: { "id": "1", "class": "container" },
//     children: [
//       {
//         tag: "h1",
//         attrs: {},
//         children: [
//           {
//             tag: "a",
//             attrs: { "href": "https://example.com", "target": "_blank" },
//             children: [
//               {
//                 tag: "img",
//                 attrs: {
//                   "src": "https://example.com/image.png",
//                   "alt": "image",
//                   "title": "image",
//                   "width": "100",
//                   "height": "100",
//                   "border": "0",
//                 },
//                 children: [
//                   {
//                     tag: "img",
//                     attrs: {
//                       "src": "https://example.com/image.png",
//                       "alt": "image",
//                       "title": "image",
//                       "width": "100",
//                       "height": "100",
//                       "border": "0",
//                     },
//                     children: [],
//                   },
//                   {
//                     tag: "img",
//                     attrs: {
//                       "src": "https://example.com/image.png",
//                       "alt": "image",
//                       "title": "image",
//                       "width": "100",
//                       "height": "100",
//                       "border": "0",
//                     },
//                     children: [],
//                   },
//                 ],
//               },
//             ],
//           },
//         ],
//       },
//     ],
//   }
//   let node2 = {
//     tag: "div",
//     attrs: { "id": "1", "class": "container" },
//     children: [
//       {
//         tag: "h1",
//         attrs: {},
//         children: [
//           {
//             tag: "a",
//             attrs: { "href": "https://example.com", "target": "_blank" },
//             children: [
//               {
//                 tag: "img",
//                 attrs: {
//                   "src": "https://example.com/image.png",
//                   "alt": "image",
//                   "title": "image",
//                   "width": "100",
//                   "height": "10",
//                   "border": "0",
//                 },
//                 children: [
//                   {
//                     tag: "img",
//                     attrs: {
//                       "src": "https://example.com/image.png",
//                       "alt": "image",
//                       "title": "image",
//                       "width": "100",
//                       "height": "100",
//                       "border": "0",
//                     },
//                     children: [],
//                   },
//                 ],
//               },
//             ],
//           },
//           {
//             tag: "b",
//             attrs: { "href": "https://example.com", "target": "_blank" },
//             children: [
//               {
//                 tag: "img",
//                 attrs: {
//                   "src": "https://example.com/image.png",
//                   "alt": "image",
//                   "title": "image",
//                   "width": "100",
//                   "height": "100",
//                   "border": "0",
//                 },
//                 children: [],
//               },
//             ],
//           },
//         ],
//       },
//     ],
//   }
//   let patches = diff(node1, node2)
//   inspect!(
//     @pp.render(patches),
//     content=
//       #|[
//       #|  MutateAttrs(3, {"src": "https://example.com/image.png", "alt": "image", "title": "image", "width": "100", "height": "10", "border": "0"}),
//       #|  Remove(5),
//       #|  InsertAfter(6, {tagName: "b", attrs: {"href": "https://example.com", "target": "_blank"}, children: [{tagName: "img", attrs: {"src": "https://example.com/image.png", "alt": "image", "title": "image", "width": "100", "height": "100", "border": "0"}, children: []}]})
//       #|]
//     ,
//   )
// }
