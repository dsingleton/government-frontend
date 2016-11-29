require 'presenter_test_helper'

class TopicalEventAboutPagePresenterTest < PresenterTestCase
  def format_name
    "topical_event_about_page"
  end

  test 'presents the basic details of a content item' do
    assert_equal schema_item['description'], presented_item.description
    assert_equal schema_item.fetch('schema_name'), presented_item.schema_name
    assert_equal schema_item['title'], presented_item.title
    assert_equal schema_item['details']['body'], presented_item.body
  end

  test 'presents a list of contents extracted from headings in the body' do
    assert_equal ['<a href="#response-in-the-uk">Response in the UK</a>',
                  '<a href="#response-in-africa">Response in Africa</a>',
                  '<a href="#advice-for-travellers">Advice for travellers</a>',
                  '<a href="#advice-for-medics">Advice for medics</a>',
                  '<a href="#advice-for-aid-workers">Advice for aid workers</a>',
                  '<a href="#how-you-can-help">How you can help</a>'
                 ], presented_item.contents
  end

  test 'presents no contents when no headings in the body' do
    assert_equal [], presented_item('slim').contents
  end

  test 'presents a breadcrumb and indicates the archive state of the parent topical event' do
    breadcrumbs = [
      { title: "Home", url: "/" },
      { title: "Ebola virus: UK government response", url: "/government/topical-events/ebola-virus-government-response" }
    ]

    travel_to(topical_event_end_date - 1) do
      assert_equal breadcrumbs, presented_item.breadcrumbs
    end

    travel_to(topical_event_end_date) do
      breadcrumbs[1][:title] = "Ebola virus: UK government response (Archived)"
      assert_equal breadcrumbs, presented_item.breadcrumbs
    end
  end

  test 'presents a breadcrumb if parent topic event has no end date' do
    breadcrumbs = [
      { title: "Home", url: "/" },
      { title: "Battle of the Somme Centenary", url: "/government/topical-events/battle-of-the-somme-centenary-commemorations" }
    ]

    refute schema_item('slim')['links']['parent'][0]['details']['end_date']
    assert_equal breadcrumbs, presented_item('slim').breadcrumbs
  end

private

  def topical_event_end_date
    Date.parse(schema_item['links']['parent'][0]['details']['end_date'])
  end
end
