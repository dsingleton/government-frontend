class GuidesPresenter < ContentItemPresenter

  def initialize(content_item, params)
    super(content_item, params)
    @params = params
    @parts = normalise_parts
  end

  def body
    if @params["section"]
      @parts.select { |part| part[:slug] == @params[:section] }[0][:body]
    else
      @parts[0][:body]
    end
  end

  def context
    nil
  end

  def is_section?
    false
  end

  def subsections
    []
  end

  def last_reviewed_or_updated_at
    Date.today
  end

  def latest_update
    "foo"
  end

  def related_links
    []
  end

  def show_metadata?
    false
  end

  def show_subscriptions?
    false
  end

  def subsections
    @parts
  end

  def related_links
    nav_helper.related_items[:sections]
  end

  def summary
  end

  def parts
    @parts
  end

  def current_part
    if @params["section"]
      @parts.select { |part| part[:slug] == @params[:section] }[0]
    else
      @parts[0]
    end
  end

  def next_part
    parts[current_part["order"]]
  end

  def prev_part
    parts[current_part["order"] - 2]
  end

  def section_title
    current_part["title"]
  end

  def additional_metadata
    {}
  end

  def format
    'multi-page'
  end

  def show_subscriptions
    true
  end

  # JSON
  private

  def normalise_parts
    _parts.each do |part|
      part["link"] = part[:web_url].sub!("https://www.gov.uk", "")
      part["title"] = part[:title]
      part["slug"] = part[:slug]
      part["order"] = part[:order]
      part["body"] = part[:body]

    end
  end


  def _parts
    [
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/getting-qualified",
        "slug": "getting-qualified",
        "order": 1,
        "title": "Getting qualified",
        "body": "<p>To become a lorry, bus or coach driver you need to:</p>\n\n<ul>\n  <li>have a full car licence</li>\n  <li>be over 18 - but there are <a href=\"/vehicles-you-can-drive\">some exceptions</a></li>\n  <li>get a professional driving qualification called the Driver Certificate of Professional Competence (<abbr title=\"Certificate of Professional Competence\">CPC</abbr>)</li>\n</ul>\n\n<h2>Who needs the full Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr></h2>\n<p>You must have the full Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> if you drive a lorry, bus or coach as the main part of your job.</p>\n\n<p>You usually need to pass 4 tests to get it, unless you have &lsquo;<a href=\"/driver-cpc-training/when-to-take-training\">acquired rights</a>&rsquo; because of your existing driving experience.</p>\n\n<h2>How to get and keep the full Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr></h2>\n\n<ol class=\"steps\">\n<li><p>Apply for a <a href=\"/become-lorry-bus-driver/applying-for-a-bus-or-lorry-provisional-entitlement\">provisional lorry or bus licence</a>.</p>\n</li>\n<li><p>Pass the 4 tests that make up Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> to qualify.</p>\n</li>\n<li><p>Take 35 hours of periodic training every 5 years to stay qualified.</p>\n</li>\n</ol>\n<p>You need to <a href=\"/driving-licence-renewal-after-45-lorry-minibus-bus\">renew your bus or lorry licence</a> every 5 years when you reach 45 and every year when you reach 65.</p>\n\n<h3>If youâ€™re taking an <abbr title=\"National Vocational Training\">NVT</abbr> course</h3>\n<p>If youâ€™re taking an approved <a href=\"/use-a-driver-cpc-national-vocational-training-nvt-concession\">National Vocational Training (<abbr title=\"National Vocational Training\">NVT</abbr>) course</a> you can drive professionally for up to 12 months without taking the Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 2 and part 4 tests.</p>\n\n<h2>Who doesn&rsquo;t need the full Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr></h2>\n<p>You don&rsquo;t need the full Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> if you:</p>\n\n<ul>\n  <li>donâ€™t want to drive for a living, for example you want to drive for a hobby or carry passengers or goods non-commercially for personal use</li>\n  <li>drive in other <a href=\"/become-lorry-bus-driver/when-you-dont-need-driver-cpc\">certain situations</a>, such as taking your vehicle for a pre-booked annual test (MOT)</li>\n</ul>\n\n<p>You still need to pass the <a href=\"/become-lorry-bus-driver/driver-cpc-part-1-theory-test\">part 1 (theory)</a> and <a href=\"/become-lorry-bus-driver/driver-cpc-part-3-driving-test\">part 3 (driving ability)</a> tests of the qualification.</p>\n\n"
      },
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/applying-for-a-bus-or-lorry-provisional-entitlement",
        "slug": "applying-for-a-bus-or-lorry-provisional-entitlement",
        "order": 2,
        "title": "Applying for a provisional lorry or bus licence",
        "body": "<p>The category of provisional licence you need depends on the <a href=\"/driving-licence-categories\">type of vehicle</a> you want to drive.</p>\n\n<h2>How to apply</h2>\n<p>To apply, order forms D2 and D4 from DVLA.</p>\n\n<div class=\"transaction\">\n<p class=\"get-started group\">\n<a class=\"button\" href=\"https://forms.dft.gov.uk/order-dvla-forms/\">Order now</a>\n</p>\n</div>\n<p><br /></p>\n\n<p>The D4 form has to be filled in by a doctor. This could be either:</p>\n\n<ul>\n  <li>your GP - but an optician might need to fill in the section about your eyesight</li>\n  <li>a private firm specialising in driversâ€™ medical exams</li>\n</ul>\n\n<p>Your doctor, optician or a private firm can charge you.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>You can only apply for a provisional trailer (+E) licence when youâ€™ve got the full licence for the vehicle youâ€™ll be driving.</p>\n</div>\n\n<h2>Send the forms</h2>\n<p>Send both forms and your photocard driving licence to DVLA. Thereâ€™s no application fee.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>You only need to include a passport-style colour photo and <a href=\"/driving-licence-application-identity-documents\">original identity documents</a> if you have a paper driving licence.</p>\n</div>\n\n<div class=\"contact\">\n<p>DVLA <br />\nSwansea <br />\nSA99 1BR</p>\n</div>\n\n<h2>How long it takes</h2>\n<p>You should get your driving licence within 3 weeks of DVLA getting your application. It can take longer if your health or personal details need to be checked.</p>\n\n<div role=\"note\" aria-label=\"Help\" class=\"application-notice help-notice\">\n<p>You automatically lose your lorry or bus licence if you lose your car licence.</p>\n</div>\n\n"
      },
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/when-you-dont-need-driver-cpc",
        "slug": "when-you-dont-need-driver-cpc",
        "order": 3,
        "title": "When you don't need the full Driver CPC",
        "body": "<p>You don't need the full Driver Certificate of Professional Competence (<abbr title=\"Certificate of Professional Competence\">CPC</abbr>) qualification if you're using the vehicle for:</p>\n\n<ul>\n  <li>non-commercial carriage of passengers or goods for personal use</li>\n  <li>carrying material or equipment you use for your job (driving the vehicle canâ€™t be the main part of your job)</li>\n  <li>driving lessons for anyone who wants to get a driving licence or a Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr></li>\n  <li>driving to or from pre-booked appointments at official vehicle testing centres</li>\n  <li>driving within 62 miles (100 kilometres) of your base - but the vehicle can&rsquo;t be carrying passengers or goods, and driving a lorry, bus or coach can&rsquo;t be your main job</li>\n  <li>maintaining public order - and the vehicle is being used or controlled by a local authority</li>\n  <li>rescue missions or in states of emergency</li>\n</ul>\n\n<p>You also donâ€™t need the full Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> if the vehicle is:</p>\n\n<ul>\n  <li>limited to a top speed of 28mph</li>\n  <li>being used or controlled by the armed forces, police, fire and rescue service, prison service or people running a prison or young offender institution</li>\n</ul>\n\n<p>You can read detailed <a href=\"/driver-cpc-exemptions-examples\">examples of Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> exemptions</a>.</p>\n\n<h2>What you need to do</h2>\n<p>If you want to become a lorry, bus or coach driver in these situations you need to:</p>\n\n<ol class=\"steps\">\n<li><p>Apply for a <a href=\"/become-lorry-bus-driver/applying-for-a-bus-or-lorry-provisional-entitlement\">provisional lorry or bus licence</a>.</p>\n</li>\n<li><p>Pass the <a href=\"/become-lorry-bus-driver/driver-cpc-part-1-theory-test\">part 1 (theory)</a> and <a href=\"/become-lorry-bus-driver/driver-cpc-part-3-driving-test\">part 3 (driving ability)</a> tests.</p>\n</li>\n</ol>\n<p>You need to <a href=\"/driving-licence-renewal-after-45-lorry-minibus-bus\">renew your bus or lorry licence</a> every 5 years when you reach 45 and every year when you reach 65.</p>\n\n"
      },
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/driver-cpc-part-1-theory-test",
        "slug": "driver-cpc-part-1-theory-test",
        "order": 4,
        "title": "Driver CPC part 1 test: theory",
        "body": "<p>You can <a href=\"/book-theory-test\">book the part 1 theory test</a> of the Driver Certificate of Professional Competence (<abbr title=\"Certificate of Professional Competence\">CPC</abbr>) as soon as youâ€™ve got your <a href=\"/become-lorry-bus-driver/applying-for-a-bus-or-lorry-provisional-entitlement\">provisional licence</a>.</p>\n\n<p>The test is made up of 2 parts - multiple choice and hazard perception. You have to book both parts separately, but you can take them on the same day.</p>\n\n<p>It doesnâ€™t matter which one you take first but you need to pass both within 2 years of each other to get your theory test certificate.</p>\n\n<h2>What to take to your test</h2>\n<p>You must take either your:</p>\n\n<ul>\n  <li>Great Britain photocard driving licence</li>\n  <li>Northern Ireland photocard driving licence and paper counterpart</li>\n</ul>\n\n<div role=\"note\" aria-label=\"Help\" class=\"application-notice help-notice\">\n<p>Your test will be cancelled and youâ€™ll lose your fee if you donâ€™t bring the right documents.</p>\n</div>\n\n<h2>How the test works</h2>\n\n<h3>Multiple-choice questions part</h3>\n<p>You can <a href=\"/practise-your-driving-theory-test\">take a practice test</a> to find out how the test works.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>The multiple-choice questions part lasts for 1 hour and 55 minutes, and the pass mark is 85 out of 100 questions.</p>\n</div>\n\n<h3>Hazard perception part</h3>\n<p>Watch a video about <a rel=\"external\" href=\"https://www.youtube.com/watch?v=SdQRkmdhwJs\">how the hazard perception part works.</a></p>\n\n<p>You&rsquo;ll watch 19 videos, and there are 20 developing hazards to spot.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>The pass mark is 67 out of 100. You can&rsquo;t review your answers.</p>\n</div>\n\n<h2>Your test result</h2>\n<p>Youâ€™ll be given a letter at the test centre with the results for the part of the theory test youâ€™ve just taken.</p>\n\n<p>When youâ€™ve passed both parts, your theory test certificate will be posted to you. You need this when you book your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 3 driving test.</p>\n\n<p>Your theory test certificate is valid for 2 years from when you passed the first part of the test.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>You need to pass the Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 3 driving test within 2 years, otherwise youâ€™ll have to pass the part 1 theory test again.</p>\n</div>\n\n<h3>If you fail the theory tests</h3>\n<p>Youâ€™ll get a results letter with feedback telling you why youâ€™ve failed.</p>\n\n<p>You can book another theory test straight away, but you canâ€™t take it for another 3 clear working days.</p>\n\n<h2>Cancelled tests</h2>\n<p>You can <a href=\"/government/publications/application-for-refunding-out-of-pocket-expenses\">apply for a refund of out-of-pocket expenses</a> if the Driver and Vehicle Standards Agency (<abbr title=\"Driver and Vehicle Standards Agency\">DVSA</abbr>) cancels your test at short notice.</p>\n\n"
      },
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/driver-cpc-part-2-case-studies-test",
        "slug": "driver-cpc-part-2-case-studies-test",
        "order": 5,
        "title": "Driver CPC part 2 test: case studies",
        "body": "<p>You can <a href=\"/book-theory-test\">book the part 2 case studies test</a> of the Driver Certificate of Professional Competence (<abbr title=\"Certificate of Professional Competence\">CPC</abbr>) as soon as youâ€™ve got your provisional licence. You donâ€™t need to have passed the Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 1 theory test.</p>\n\n<h2>What to take to your test</h2>\n<p>You must take either your:</p>\n\n<ul>\n  <li>Great Britain photocard driving licence</li>\n  <li>Northern Ireland photocard driving licence and paper counterpart</li>\n</ul>\n\n<div role=\"note\" aria-label=\"Help\" class=\"application-notice help-notice\">\n<p>Your test will be cancelled and youâ€™ll lose your fee if you donâ€™t bring the right documents.</p>\n</div>\n\n<h2>How the test works</h2>\n\n<p>The test is made up of 7 case studies you work through on a computer. The case studies are short stories based on situations that youâ€™re likely to come across in your working life.</p>\n\n<p>Youâ€™ll be asked between 6 and 8 multiple-choice questions on each case study.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>The test lasts for 1 hour and 15 minutes, and the pass mark is 40 out of 50.</p>\n</div>\n\n<h2>Your test result</h2>\n<p>Youâ€™ll get a letter with the results at the test centre.</p>\n\n<p>You need the test pass reference number when you book your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 4 practical demonstration test.</p>\n\n<p>The pass letter is valid for 2 years.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>You need to pass the Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 4 practical demonstration test within 2 years, otherwise youâ€™ll have to pass the part 2 case studies test again.</p>\n</div>\n\n<h3>If you fail the test</h3>\n<p>Youâ€™ll get a result letter with feedback telling you why youâ€™ve failed.</p>\n\n<p>You can book another case studies test straight away, but you canâ€™t take it for another 3 clear working days.</p>\n\n<h2>Cancelled tests</h2>\n<p>You can <a href=\"/government/publications/application-for-refunding-out-of-pocket-expenses\">apply for a refund of out-of-pocket expenses</a> if the Driver and Vehicle Standards Agency (<abbr title=\"Driver and Vehicle Standards Agency\">DVSA</abbr>) cancels your test at short notice.</p>\n\n"
      },
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/driver-cpc-part-3-driving-test",
        "slug": "driver-cpc-part-3-driving-test",
        "order": 6,
        "title": "Driver CPC part 3 test: driving ability",
        "body": "<p>You must have passed the Driver Certificate of Professional Competence (<abbr title=\"Certificate of Professional Competence\">CPC</abbr>) part 1 theory test before you can <a href=\"/book-driving-test\">book the Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 3 test</a>.</p>\n\n<h2>What to take to your test</h2>\n\n<p>You must bring these to your test:</p>\n\n<ul>\n  <li>your valid Great Britain photocard driving licence, or Northern Ireland photocard driving licence and paper counterpart</li>\n  <li>a <a href=\"/rules-for-lorries-used-for-driving-tests\">lorry</a> or a <a href=\"/rules-for-buses-and-coaches-used-for-driving-tests\">bus or coach</a> that meets the rules</li>\n</ul>\n\n<div role=\"note\" aria-label=\"Help\" class=\"application-notice help-notice\">\n<p>Your test will be cancelled and youâ€™ll lose your fee if you donâ€™t bring these.</p>\n</div>\n\n<h2>How the test works</h2>\n\n<p>Your practical test will last about 1 hour and 30 minutes and includes:</p>\n\n<ul>\n  <li>vehicle safety questions</li>\n  <li>practical road driving</li>\n  <li>off-road exercises</li>\n</ul>\n\n<h3>Vehicle safety questions</h3>\n\n<p>During your test youâ€™ll be asked vehicle safety questions on either:</p>\n\n<ul>\n  <li><a href=\"/government/publications/lorry-and-bus-show-me-tell-me-vehicle-safety-questions\">lorries, buses and coaches</a></li>\n  <li><a href=\"/government/publications/lorry-and-bus-with-trailer-show-me-tell-me-vehicle-safety-questions\">lorries, buses and coaches towing trailers</a></li>\n</ul>\n\n<h3>Practical road driving</h3>\n\n<p>During your practical road driving, the examiner will see how you:</p>\n\n<ul>\n  <li>use the vehicle controls</li>\n  <li>move away at an angle, uphill and downhill</li>\n  <li>do a controlled stop</li>\n  <li>use the mirrors</li>\n  <li>give appropriate signals</li>\n  <li>show awareness and anticipation of other road usersâ€™ intentions</li>\n  <li>manage your progress and control your vehicle speed</li>\n  <li>deal with hazards</li>\n  <li>select a safe place to stop</li>\n</ul>\n\n<p>There will also be 10 minutes of independent driving, designed to test your ability to drive safely while making independent decisions.</p>\n\n<h3>Off-road exercises</h3>\n\n<p>The off-road exercises will include:</p>\n\n<ul>\n  <li>an â€˜Sâ€™ shaped reverse into a bay</li>\n  <li>showing the uncoupling and recoupling procedure if youâ€™re taking a test with a trailer</li>\n</ul>\n\n<h2>Test result</h2>\n<p>After you've taken the practical test your examiner will tell you if youâ€™ve passed and explain how you did.</p>\n\n<p>Youâ€™ll pass your test if you make:</p>\n\n<ul>\n  <li>15 or fewer driving faults</li>\n  <li>no serious or dangerous faults</li>\n</ul>\n\n<p>If you fail, you can book another driving test straight away, but you canâ€™t take it for another 3 clear working days.</p>\n\n<h2>Cancelled tests</h2>\n<p>You can <a href=\"/government/publications/application-for-refunding-out-of-pocket-expenses\">apply for a refund of out-of-pocket expenses</a> if the Driver and Vehicle Standards Agency (<abbr title=\"Driver and Vehicle Standards Agency\">DVSA</abbr>) cancels your test at short notice.</p>\n\n"
      },
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/driver-cpc-part-4-practical-demonstration-test",
        "slug": "driver-cpc-part-4-practical-demonstration-test",
        "order": 7,
        "title": "Driver CPC part 4 test: practical demonstration",
        "body": "<p>You must have passed the Driver Certificate of Professional Competence (<abbr title=\"Certificate of Professional Competence\">CPC</abbr>) part 2 test before you can <a href=\"/book-driving-test\">book the Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 4 test</a>.</p>\n\n<h2>What to take to your test</h2>\n<p>You must bring:</p>\n\n<ul>\n  <li>your valid Great Britain photocard driving licence, or Northern Ireland photocard driving licence and paper counterpart</li>\n  <li>a <a href=\"/rules-for-lorries-used-for-driving-tests\">lorry</a> or a <a href=\"/rules-for-buses-and-coaches-used-for-driving-tests\">bus or coach</a> that meets the rules</li>\n</ul>\n\n<div role=\"note\" aria-label=\"Help\" class=\"application-notice help-notice\">\n<p>Your test will be cancelled and youâ€™ll lose your fee if you donâ€™t bring these.</p>\n</div>\n\n<h2>How the test works</h2>\n<p>Youâ€™re tested on being able to:</p>\n\n<ul>\n  <li>load the vehicle following safety rules and to keep it secure</li>\n  <li>stop trafficking in illegal immigrants</li>\n  <li>assess emergency situations</li>\n  <li>do a walkaround vehicle safety check</li>\n</ul>\n\n<p>The test is made up of 5 topics from the <a href=\"/government/publications/driver-cpc-syllabus\">Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> syllabus</a>. You can score up to 20 points for each topic.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>To pass you have to score at least 15 out of 20 in each topic area and have an overall score of at least 80 out of 100.</p>\n</div>\n\n<h2>Test result</h2>\n<p>At the end of your test the examiner will tell you if youâ€™ve passed.</p>\n\n<p>If you fail, you can book another driving test straight away, but you canâ€™t take it for another 3 clear working days.</p>\n\n<h2>Cancelled tests</h2>\n<p>You can <a href=\"/government/publications/application-for-refunding-out-of-pocket-expenses\">apply for a refund of out-of-pocket expenses</a> if the Driver and Vehicle Standards Agency (<abbr title=\"Driver and Vehicle Standards Agency\">DVSA</abbr>) cancels your test at short notice.</p>\n\n"
      },
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/after-youve-qualified",
        "slug": "after-youve-qualified",
        "order": 8,
        "title": "After you've qualified",
        "body": "<p>After youâ€™ve passed all 4 of the Driver Certificate of Professional Competence (<abbr title=\"Certificate of Professional Competence\">CPC</abbr>) tests, youâ€™ll be sent a Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card. This is sometimes called a â€˜driver qualification cardâ€™ or â€˜DQCâ€™.</p>\n\n<p>You must carry your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card while driving a lorry, bus or coach professionally.</p>\n\n<div role=\"note\" aria-label=\"Help\" class=\"application-notice help-notice\">\n<p>You can get a Â£50 fixed penalty for driving professionally without your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card.</p>\n</div>\n\n<h2>Getting your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card</h2>\n\n<p>The card will be sent to the address on your driving licence. You need to <a href=\"/change-address-driving-licence\">change this address</a> first if itâ€™s wrong.</p>\n\n<p>The photograph and signature on your photocard licence will be used on your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card.</p>\n\n<h3>Waiting for your card</h3>\n\n<p>You can drive professionally if youâ€™ve passed all the tests and youâ€™re waiting for your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card to arrive.</p>\n\n<h3>If your card doesnâ€™t arrive</h3>\n\n<p>You should get your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card within 20 days of passing the final test. Contact the Driver and Vehicle Standards Agency (<abbr title=\"Driver and Vehicle Standards Agency\">DVSA</abbr>) if you donâ€™t receive it.</p>\n\n<div class=\"contact\">\n<p><strong>Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card replacements</strong><br />\n<a href=\"&#109;&#097;&#105;&#108;&#116;&#111;:&#099;&#112;&#099;&#114;&#101;&#064;&#100;&#118;&#115;&#097;&#046;&#103;&#111;&#118;&#046;&#117;&#107;\">&#099;&#112;&#099;&#114;&#101;&#064;&#100;&#118;&#115;&#097;&#046;&#103;&#111;&#118;&#046;&#117;&#107;</a><br />\nTelephone: 0191 201 8112<br />\nMonday to Friday, 8am to 5pm<br />\n<a href=\"/call-charges\">Find out about call charges</a></p>\n</div>\n\n<p>You have to pay Â£25 if:</p>\n\n<ul>\n  <li>you take longer than 3 months to tell <abbr title=\"Driver and Vehicle Standards Agency\">DVSA</abbr> it hasnâ€™t arrived</li>\n  <li>itâ€™s sent to an old address because you havenâ€™t updated your licence</li>\n</ul>\n\n<h2>Replace your card</h2>\n\n<p>You must <a href=\"/replace-driver-cpc-card\">replace your Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card</a> if itâ€™s lost or stolen.</p>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>The Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card doesnâ€™t have your address on it, so you donâ€™t have to get a new one if your address changes.</p>\n</div>\n\n<h2>Staying qualified</h2>\n\n<p>Every 5 years you must:</p>\n\n<ul>\n  <li>take 35 hours of <a href=\"/driver-cpc-training\">Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> training</a> to keep driving professionally</li>\n  <li><a href=\"/driving-licence-renewal-after-45-lorry-minibus-bus\">renew your lorry or bus driving licence</a> if you&rsquo;re over 45</li>\n</ul>\n\n"
      },
      {
        "web_url": "https://www.gov.uk/become-lorry-bus-driver/fees",
        "slug": "fees",
        "order": 9,
        "title": "Fees",
        "body": "<h2>Provisional licence</h2>\n\n<table>\n  <thead>\n    <tr>\n      <th>Fee type</th>\n      <th>Cost</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>Application for a provisional lorry or bus licence</td>\n      <td>No charge</td>\n    </tr>\n  </tbody>\n</table>\n\n<h2>Test costs</h2>\n\n<table>\n  <thead>\n    <tr>\n      <th>Fee type</th>\n      <th>Weekday</th>\n      <th>Evening, weekend <br />and bank holiday</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 1 - <br />theory - (multiple-choice)</td>\n      <td>Â£26</td>\n      <td>Â£26</td>\n    </tr>\n    <tr>\n      <td>Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 1 - <br />theory - (hazard perception)</td>\n      <td>Â£11</td>\n      <td>Â£11</td>\n    </tr>\n    <tr>\n      <td>Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 2 - <br />case studies</td>\n      <td>Â£23</td>\n      <td>Â£23</td>\n    </tr>\n    <tr>\n      <td>Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 3 - <br />driving ability</td>\n      <td>Â£115</td>\n      <td>Â£141</td>\n    </tr>\n    <tr>\n      <td>Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> part 4 - <br />practical demonstration</td>\n      <td>Â£55</td>\n      <td>Â£63</td>\n    </tr>\n  </tbody>\n</table>\n\n<div role=\"note\" aria-label=\"Information\" class=\"application-notice info-notice\">\n<p>These are the prices to book your tests using the official service. Unofficial websites may charge more.</p>\n</div>\n\n<h2>Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card costs</h2>\n\n<table>\n  <thead>\n    <tr>\n      <th>Fee type</th>\n      <th>Cost</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>Driver <abbr title=\"Certificate of Professional Competence\">CPC</abbr> card (non-UK driving licences only)</td>\n      <td>Â£25</td>\n    </tr>\n    <tr>\n      <td>Replacement for lost, stolen or damaged card</td>\n      <td>Â£25</td>\n    </tr>\n  </tbody>\n</table>\n\n<h2><abbr title=\"National Vocational Training\">NVT</abbr> concession fees</h2>\n\n<table>\n  <thead>\n    <tr>\n      <th>Fee type</th>\n      <th>Cost</th>\n    </tr>\n  </thead>\n  <tbody>\n    <tr>\n      <td>National Vocational Training (<abbr title=\"National Vocational Training\">NVT</abbr>) concession card</td>\n      <td>Â£25</td>\n    </tr>\n  </tbody>\n</table>\n\n"
      }
    ]
  end
end
