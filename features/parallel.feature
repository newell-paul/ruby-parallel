Feature: Parallel Sitemap

  Scenario: Are all links ok?
    When I open the BBC sitemap
    Then I can validate the first 100 links in the sitemap xml
