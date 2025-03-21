<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="2.0"
      xmlns:xs="http://www.w3.org/2001/XMLSchema"
      xpath-default-namespace="http://www.tei-c.org/ns/1.0" exclude-result-prefixes="xs"
      xmlns="http://www.w3.org/1999/xhtml">
      <xsl:output method="xhtml" doctype-system="about:legacy-compat" omit-xml-declaration="yes"/>
      <!--GLOBAL VARIABLES-->
      <xsl:variable name="graveyardFile" select="document('graveyardInfo-TEI.xml')"/>
      <xsl:variable name="numPeople" select="count(//person[@role = 'occupant'])"/>
      <xsl:variable name="allAges" select="//person[@role = 'occupant']//age"/>
      <xsl:variable name="minAge" select="number(min(//person[@role = 'occupant']//age))"/>
      <xsl:variable name="maxAge" select="number(max(//person[@role = 'occupant']//age))"/>
      <xsl:variable name="distinctAges" select="distinct-values(//person[@role = 'occupant']//age)"/>
      <xsl:variable name="xSpacer" select="10"/>
      <xsl:variable name="ySpacer" select="30"/>
      <xsl:variable name="xPos" select="position() * $xSpacer"/>
      <xsl:variable name="yPos" select="position() * $ySpacer"/>
      <xsl:variable name="female0to2"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 2])"/>
      <xsl:variable name="male0to2"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 2])"/>

      <xsl:variable name="female3to10"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 10 and number() gt 2])"/>
      <xsl:variable name="male3to10"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 10 and number() gt 2])"/>

      <xsl:variable name="female11to19"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 19 and number() gt 10])"/>
      <xsl:variable name="male11to19"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 19 and number() gt 10])"/>

      <xsl:variable name="female20to29"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 29 and number() gt 19])"/>
      <xsl:variable name="male20to29"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 29 and number() gt 19])"/>

      <xsl:variable name="female30to39"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 39 and number() gt 29])"/>
      <xsl:variable name="male30to39"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 39 and number() gt 29])"/>

      <xsl:variable name="female40to49"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 49 and number() gt 39])"/>
      <xsl:variable name="male40to49"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 49 and number() gt 39])"/>

      <xsl:variable name="female50to59"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 59 and number() gt 49])"/>
      <xsl:variable name="male50to59"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 59 and number() gt 49])"/>

      <xsl:variable name="female60to69"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 69 and number() gt 59])"/>
      <xsl:variable name="male60to69"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 69 and number() gt 59])"/>

      <xsl:variable name="female70to79"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 79 and number() gt 69])"/>
      <xsl:variable name="male70to79"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 79 and number() gt 69])"/>

      <xsl:variable name="female80to89"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 89 and number() gt 79])"/>
      <xsl:variable name="male80to89"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 89 and number() gt 79])"/>

      <xsl:variable name="female90to99"
            select="count(//person[@role = 'occupant'][@sex = 'f']//age[number() le 99 and number() gt 89])"/>
      <xsl:variable name="male90to99"
            select="count(//person[@role = 'occupant'][@sex = 'm']//age[number() le 99 and number() gt 89])"/>


      <xsl:template match="/">
            <html>
                  <head>
                        <title>Age Graph</title>
                        <link rel="stylesheet" type="text/css" href="style.css" />
                  </head>
                  <body>
                        <div id="ageBarGraph">
                              <svg xmlns="http://www.w3.org/2000/svg" width="1300" height="700">
                                    <g transform="translate(0 600)">
                                          <!-- Y Axis -->
                                          <line x1="75" x2="75" y1="0" y2="-450" stroke="black"
                                                stroke-width="1"/>
                                          <!-- X Axis -->
                                          <line x1="75" x2="1200" y1="0" y2="0" stroke="black"
                                                stroke-width="1"/>

                                          <text x="400" y="-450" font-size="25px">Common Age of
                                                Death in Brush Creek Cemetery</text>
                                          <!-- Y Axis -->
                                          <text x="50" y="-10" font-size="20px">1</text>
                                          <line x1="70" x2="80" y1="-10" y2="-10" stroke="black"
                                                stroke-width="2"/>
                                          <text x="50" y="-50" font-size="20px">5</text>
                                          <line x1="70" x2="80" y1="-50" y2="-50" stroke="black"
                                                stroke-width="2"/>
                                          <text x="50" y="-100" font-size="20px">10</text>
                                          <line x1="70" x2="80" y1="-100" y2="-100" stroke="black"
                                                stroke-width="2"/>
                                          <text x="50" y="-150" font-size="20px">15</text>
                                          <line x1="70" x2="80" y1="-150" y2="-150" stroke="black"
                                                stroke-width="2"/>
                                          <text x="50" y="-200" font-size="20px">20</text>
                                          <line x1="70" x2="80" y1="-200" y2="-200" stroke="black"
                                                stroke-width="2"/>
                                          <text x="50" y="-250" font-size="20px">25</text>
                                          <line x1="70" x2="80" y1="-250" y2="-250" stroke="black"
                                                stroke-width="2"/>
                                          <text x="50" y="-300" font-size="20px">30</text>
                                          <line x1="70" x2="80" y1="-300" y2="-300" stroke="black"
                                                stroke-width="2"/>
                                          <text x="50" y="-350" font-size="20px">35</text>
                                          <line x1="70" x2="80" y1="-350" y2="-350" stroke="black"
                                                stroke-width="2"/>
                                          <text x="50" y="-400" font-size="20px">40</text>
                                          <line x1="70" x2="80" y1="-400" y2="-400" stroke="black"
                                                stroke-width="2"/>

                                          <xsl:comment> Bars start here</xsl:comment>

                                          <g id="svg_0to2">
                                                <line x1="100" y1="-{$female0to2 * $xSpacer}"
                                                  x2="100" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="100" y1="-{$female0to2 * $xSpacer}"
                                                  x2="100"
                                                  y2="-{($male0to2 * $xSpacer) + ($female0to2 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="80" y="25" font-size="20px">0-2</text>

                                          <g id="svg_3to10">
                                                <line x1="200" y1="-{$female3to10 * $xSpacer}"
                                                  x2="200" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="200" y1="-{$female3to10 * $xSpacer}"
                                                  x2="200"
                                                  y2="-{($male3to10 * $xSpacer) + ($female3to10 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="180" y="25" font-size="20px">3-10</text>

                                          <g id="svg_11to19">
                                                <line x1="300" y1="-{$female11to19 * $xSpacer}"
                                                  x2="300" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="300" y1="-{$female11to19 * $xSpacer}"
                                                  x2="300"
                                                  y2="-{($male11to19 * $xSpacer) + ($female11to19 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="280" y="25" font-size="20px">11-19</text>

                                          <g id="svg_20to29">
                                                <line x1="400" y1="-{$female20to29 * $xSpacer}"
                                                  x2="400" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="400" y1="-{$female20to29 * $xSpacer}"
                                                  x2="400"
                                                  y2="-{($male20to29 * $xSpacer) + ($female20to29 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="380" y="25" font-size="20px">20-29</text>

                                          <g id="svg_30to39">
                                                <line x1="500" y1="-{$female30to39 * $xSpacer}"
                                                  x2="500" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="500" y1="-{$female30to39 * $xSpacer}"
                                                  x2="500"
                                                  y2="-{($male30to39 * $xSpacer) + ($female30to39 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="480" y="25" font-size="20px">30-39</text>

                                          <g id="svg_40to49">
                                                <line x1="600" y1="-{$female40to49 * $xSpacer}"
                                                  x2="600" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="600" y1="-{$female40to49 * $xSpacer}"
                                                  x2="600"
                                                  y2="-{($male40to49 * $xSpacer) + ($female40to49 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="580" y="25" font-size="20px">40-49</text>

                                          <g id="svg_50to59">
                                                <line x1="700" y1="-{$female50to59 * $xSpacer}"
                                                  x2="700" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="700" y1="-{$female50to59 * $xSpacer}"
                                                  x2="700"
                                                  y2="-{($male50to59 * $xSpacer) + ($female50to59 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="680" y="25" font-size="20px">50-59</text>

                                          <g id="svg_60to69">
                                                <line x1="800" y1="-{$female60to69 * $xSpacer}"
                                                  x2="800" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="800" y1="-{$female60to69 * $xSpacer}"
                                                  x2="800"
                                                  y2="-{($male60to69 * $xSpacer) + ($female60to69 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="780" y="25" font-size="20px">60-69</text>

                                          <g id="svg_70to79">
                                                <line x1="900" y1="-{$female70to79 * $xSpacer}"
                                                  x2="900" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="900" y1="-{$female70to79 * $xSpacer}"
                                                  x2="900"
                                                  y2="-{($male70to79 * $xSpacer) + ($female70to79 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="880" y="25" font-size="20px">70-79</text>

                                          <g id="svg_80to89">
                                                <line x1="1000" y1="-{$female80to89 * $xSpacer}"
                                                  x2="1000" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="1000" y1="-{$female80to89 * $xSpacer}"
                                                  x2="1000"
                                                  y2="-{($male80to89 * $xSpacer) + ($female80to89 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="980" y="25" font-size="20px">80-89</text>

                                          <g id="svg_90to99">
                                                <line x1="1100" y1="-{$female90to99 * $xSpacer}"
                                                  x2="1100" y2="0"
                                                  style="stroke:#FFCCFF; stroke-width:45"/>
                                                <line x1="1100" y1="-{$female90to99 * $xSpacer}"
                                                  x2="1100"
                                                  y2="-{($male90to99 * $xSpacer) + ($female90to99 * $xSpacer)}"
                                                  style="stroke:#15B7FF; stroke-width:45"/>
                                          </g>

                                          <text x="1080" y="25" font-size="20px">90-99</text>

                                          <g class="legend">
                                                <text x="100" y="-400" font-size="30px"
                                                  >Legend</text>

                                                <line x1="100" x2="130" y1="-350" y2="-350"
                                                  stroke="#15B7FF" stroke-width="30"/>
                                                <text x="140" y="-350" text-anchor="start"
                                                  font-size="18px">Men</text>

                                                <line x1="100" x2="130" y1="-300" y2="-300"
                                                  stroke="#FFCCFF" stroke-width="30"/>
                                                <text x="140" y="-300" text-anchor="start"
                                                  font-size="18px">Women</text>
                                          </g>


                                          <text x="600" y="75" font-size="25px"> Age of Death</text>
                                          <text x="25" y="-200" font-size="25px"
                                                text-anchor="middle"
                                                style="writing-mode: tb; letter-spacing:10"
                                                rotate="-90"> Amount of Peop le</text>



                                    </g>
                              </svg>
                        </div>

                        <div id="ageGraphTable">
                              <table id="ageResults">
                                    <tr class="header">
                                          <th>Ages Range</th>
                                          <th>Men</th>
                                          <th>Women</th>
                                          <th>Total</th>
                                    </tr>

                                    <tr id="0to2">
                                          <td>
                                                <xsl:text> 0 to 2</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male0to2"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female0to2"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male0to2 + $female0to2)"/>
                                          </td>
                                    </tr>

                                    <tr id="3to10">
                                          <td>
                                                <xsl:text> 3 to 10 </xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male3to10"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female3to10"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male3to10 + $female3to10)"/>
                                          </td>
                                    </tr>

                                    <tr id="11to19">
                                          <td>
                                                <xsl:text> 11 to 19</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male11to19"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female11to19"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male11to19 + $female11to19)"
                                                />
                                          </td>
                                    </tr>

                                    <tr id="20to29">
                                          <td>
                                                <xsl:text> 20 to 29</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male20to29"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female20to29"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male20to29 + $female20to29)"
                                                />
                                          </td>
                                    </tr>

                                    <tr id="30to39">
                                          <td>
                                                <xsl:text> 30 to 39</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male30to39"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female30to39"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male30to39 + $female30to39)"
                                                />
                                          </td>
                                    </tr>

                                    <tr id="40to49">
                                          <td>
                                                <xsl:text> 40 to 49</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male40to49"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female40to49"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male40to49 + $female40to49)"
                                                />
                                          </td>
                                    </tr>

                                    <tr id="50to59">
                                          <td>
                                                <xsl:text> 50 to 59</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male50to59"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female50to59"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male50to59 + $female50to59)"
                                                />
                                          </td>
                                    </tr>

                                    <tr id="60to69">
                                          <td>
                                                <xsl:text> 60 to 69</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male60to69"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female60to69"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male60to69 + $female60to69)"
                                                />
                                          </td>
                                    </tr>

                                    <tr id="70to79">
                                          <td>
                                                <xsl:text> 70 to 79</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male70to79"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female70to79"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male70to79 + $female70to79)"
                                                />
                                          </td>
                                    </tr>

                                    <tr id="80to89">
                                          <td>
                                                <xsl:text> 80 to 89</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male80to89"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female80to89"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male80to89 + $female80to89)"
                                                />
                                          </td>
                                    </tr>

                                    <tr id="90to99">
                                          <td>
                                                <xsl:text> 90 to 99</xsl:text>
                                          </td>
                                          <td>
                                                <xsl:value-of select="$male90to99"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="$female90to99"/>
                                          </td>

                                          <td>
                                                <xsl:value-of select="($male90to99 + $female90to99)"
                                                />
                                          </td>
                                    </tr>
                              </table>
                        </div>
                  </body>
            </html>
      </xsl:template>

</xsl:stylesheet>
