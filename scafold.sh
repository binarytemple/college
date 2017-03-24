mix phoenix.gen.html User users is_student:boolean salutation:string forname:string surname:string age:integer location:string photo:string
mix phoenix.gen.html Artefact artefacts user_id:references:users url:string title:string description:text

mix phoenix.gen.html Course courses  title:string

mix phoenix.gen.html UserCourse user_courses user_id:references:users course_id:references:courses

mix phoenix.gen.html Exhibition exhibitions title:string description:string 
mix phoenix.gen.html ExhibitionUser exhibitions_users user_id:references:users exhibition_id:references:exhibitions title:string description:string 
