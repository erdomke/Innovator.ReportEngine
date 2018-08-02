<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:user="urn:user-scripts" xmlns:aras="http://www.aras.com" version="1.0">
	  <xsl:output method="html" omit-xml-declaration="yes" standalone="yes" indent="yes" cdata-section-elements="script msxsl:script"/>
	  <xsl:template match="/">
		    <xsl:apply-templates/>
	  </xsl:template>
	  <xsl:template match="/*[local-name()='Envelope']">
		    <xsl:apply-templates/>
	  </xsl:template>
	  <xsl:template match="/*[local-name()='Envelope']/*[local-name()='Body']">
		    <xsl:apply-templates/>
	  </xsl:template>
	  <xsl:template match="/*[local-name()='Envelope']/*[local-name()='Body']/Result">
		    <xsl:apply-templates select="Item"/>
	  </xsl:template>
	  <xsl:template match="Item[@type='ItemType']">
		    <html>
			      <head>
				        <title>
					ItemType Definition Report for "
					          <xsl:value-of select="name"/>
				        "</title>
			      </head>
			      <style>
				           span.title{font-family:Verdana; font-size:16pt; font-color: red;}
				           td {font-family:Arial; font-size:8pt; padding-left:5px; padding-right:5px; border-width:1;}
				           td.headLabel {font-size:8pt; font-weight:bold; text-align:right; vertical-align:bottom;}
				           td.headValue {font-size:8pt; padding-right:5px; vertical-align:bottom; border-right:solid; border-width:1px;}
				           td.label {font-weight:bold; text-align:center;}
				           td.value {border-style:solid;}
				           td.section {font-size:11pt; background-color:#dddddd;}
				           table {width: 700px}
				           table.border {width: 700px; empty-cells:show; border-collapse:collapse; border-style:solid; border-width:1}
				           table.noborder {width: 700px; empty-cells:show; border-collapse:collapse; border-width:0}
				           th {font-family:Arial; font-size:8pt; border-style:solid; border-width:1; padding-right:5px; padding-left:5px; text-align:center;}
			      </style>
			      <style type="text/css" userData="Global">
				.cellSolid {
				border-top:1px #000000 solid;
				border-right:1px #000000 solid;
				border-bottom:1px #000000 solid;
				border-left:1px #000000 solid;
				}
				.cellSolidTopRight {
				border-top:1px #000000 solid;
				border-right:1px #000000 solid;
				}
				.cellSolidTopLeft {
				border-top:1px #000000 solid;
				border-left:1px #000000 solid;
				}
				.cellSolidRightBottom {
				border-right:1px #000000 solid;
				border-bottom:1px #000000 solid;
				}
				.cellSolidBottomLeft {
				border-bottom:1px #000000 solid;
				border-left:1px #000000 solid;
				}
				.cellSolidTop {
				border-top:1px #000000 solid;
				}
				.cellSolidRight {
				border-right:1px #000000 solid;
				}
				.cellSolidBottom {
				border-bottom:1px #000000 solid;
				}
				.cellSolidLeft {
				border-left:1px #000000 solid;
				}
				.cellDashed {
				border-top:1px #666666 dashed;
				border-right:1px #666666 dashed;
				border-bottom:1px #666666 dashed;
				border-left:1px #666666 dashed;
				}
				.cellDashedTopRight {
				border-top:1px #666666 dashed;
				border-right:1px #666666 dashed;
				}
				.cellDashedTopLeft {
				border-top:1px #666666 dashed;
				border-left:1px #666666 dashed;
				}
				.cellDashedBottomRight {
				border-bottom:1px #666666 dashed;
				border-right:1px #666666 dashed;
				}
				.cellDashedBottomLeft {
				border-bottom:1px #666666 dashed;
				border-left:1px #666666 dashed;
				}
				.cellDashedTop {
				border-top:1px #666666 dashed;
				}
				.cellDashedRight {
				border-right:1px #666666 dashed;
				}
				.cellDashedBottom {
				border-bottom:1px #666666 dashed;
				}
				.cellDashedLeft {
				border-left:1px #666666 dashed;
				}
				.cellHeader {
				background-color:#CCCCCC;
				border-top:1px #000000 solid;
				border-right:1px #000000 solid;
				border-bottom:1px #000000 solid;
				padding:2px;
				text-align:center;
				text-transform:capitalize;
				text-align:center;
				font-family:helvetica;
				font-weight:bold;
				font-size:8pt;
				}
				.cellHeaderVertBT {
				background-color:#CCCCCC;
				border-top:1px #000000 solid;
				border-right:1px #000000 solid;
				border-bottom:1px #000000 solid;
				border-left:1px #000000 solid;
				padding:2px;
				writing-mode:tb-rl;filter: flipv fliph;
				text-align:center;
				text-transform:capitalize;
				text-align:center;
				font-family:helvetica;
				font-weight:bold;
				font-size:8pt;
				}
				.cellHeaderVertTB {
				background-color:#CCCCCC;
				border-top:1px #000000 solid;
				border-right:1px #000000 solid;
				border-bottom:1px #000000 solid;
				border-left:1px #000000 solid;
				padding:2px;
				writing-mode:tb-rl;filter: flipv flipv;
				text-align:center;
				text-transform:capitalize;
				text-align:center;
				font-family:helvetica;
				font-weight:bold;
				font-size:8pt;
				}
			</style>
			      <body>
				    <!-- ItemType Properties -->
				        <span class="title">
					ItemType Definition Report for "
					          <xsl:value-of select="name"/>
				        "</span>
				        <br/>
				        <br/>
				        <table class="noborder">
					          <tr>
						            <td class="headLabel">Name:</td>
						            <td class="headValue">
							              <xsl:value-of select="name"/>
						            </td>
						            <td class="headLabel">Lifecycle:</td>
						            <td class="headValue">
							              <xsl:value-of select="default_lifecycle/@keyed_name"/>
						            </td>
						            <td class="headLabel">Structure View:</td>
						            <td class="headValue" style="text-transform:capitalize;">
							              <xsl:value-of select="structure_view"/>
						            </td>
						            <td class="label" style="border-style:solid; padding-left:0;">Class Structure</td>
					    </tr>
					          <tr>
						            <td class="headLabel">Singular Label:</td>
						            <td class="headValue">
							              <xsl:value-of select="label"/>
						            </td>
						            <td class="headLabel">Revisions:</td>
						            <td class="headValue">
							              <xsl:value-of select="revisions/@keyed_name"/>
						            </td>
						            <td class="headLabel">Auto Search:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="auto_search='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
						            <td rowspan="7" class="headValue" style="padding-left:10px; border-style:solid; vertical-align:middle;">
							              <xsl:apply-templates select="class_structure/class"/>
						     </td>
					    </tr>
					          <tr>
						            <td class="headLabel">Plural Label:</td>
						            <td class="headValue">
							              <xsl:value-of select="label_plural"/>
						            </td>
						            <td class="headLabel">Versionable:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="is_versionable='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
						            <td class="headLabel">Default Page Size:</td>
						            <td class="headValue">
							              <xsl:value-of select="default_page_size"/>
						            </td>
					    </tr>
					          <tr>
						            <td class="headLabel" rowspan="2">Small Icon:</td>
						            <td class="headValue" rowspan="2">
							              <xsl:if test="string(open_icon)!=''">
								               <img src="{open_icon}" style="max-width: 16px; max-height: 16px;">
									                <xsl:attribute name="alt">
										                 <xsl:call-template name="strip-path">
											                      <xsl:with-param name="input" select="open_icon"/>
										                 </xsl:call-template>
									                </xsl:attribute>
								               </img>
							              </xsl:if>
						            </td>
						            <td class="headLabel">Manual Versioning:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="manual_versioning='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
						            <td class="headLabel">Max Records:</td>
						            <td class="headValue">
							              <xsl:value-of select="maxrecords"/>
						            </td>
					    </tr>
					          <tr>
						            <td class="headLabel">Dependent:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="is_dependent='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
						            <td class="headLabel">Unlock On Logout:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="unlock_on_logout='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
					    </tr>
					          <tr>
						            <td class="headLabel" rowspan="2">Large Icon:</td>
						            <td class="headValue" rowspan="2">
							              <xsl:if test="string(open_icon)!=''">
								               <img src="{large_icon}" style="max-width: 32px; max-height: 32px;">
									                <xsl:attribute name="alt">
										                 <xsl:call-template name="strip-path">
											                      <xsl:with-param name="input" select="large_icon"/>
										                 </xsl:call-template>
									                </xsl:attribute>
								               </img>
							              </xsl:if>
						            </td>
						            <td class="headLabel">Use Source Access:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="use_src_access='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
						            <td class="headLabel">Private Permissions:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="allow_private_permissions='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
					    </tr>
					          <tr>
						            <td class="headLabel">Save History:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="save_history='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
						            <td class="headLabel">Relationship:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="is_relationship='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
					    </tr>
					          <tr>
						            <td class="headLabel">Implementation:</td>
						            <td class="headValue" style="text-transform:capitalize;">
							              <xsl:value-of select="implementation_type"/>
						            </td>
						            <td class="headLabel">Show Params Tab:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="show_parameters_tab='1'">When Populated</xsl:when>
								                <xsl:when test="show_parameters_tab='2'">Always</xsl:when>
								                <xsl:otherwise>Never</xsl:otherwise>
							      </xsl:choose>
						     </td>
						            <td class="headLabel">Core:</td>
						            <td class="headValue">
							              <xsl:choose>
								                <xsl:when test="core='1'">Yes</xsl:when>
								                <xsl:otherwise>No</xsl:otherwise>
							      </xsl:choose>
						     </td>
					    </tr>
				    </table>
				        <br/>
				    <!-- Properties -->
				        <xsl:if test="boolean(Relationships/Item[@type='Property'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="11">
								                <b>Properties</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Property Name</th>
							              <th>Label</th>
							              <th>Data Type</th>
							              <th>Options</th>
							              <th>Hid</th>
							              <th>Hid2</th>
							              <th>Align</th>
							              <th>Width</th>
							              <th>Sort</th>
							              <th>Other</th>
							              <th>Help Text</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Property']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- RelationshipTypes -->
				        <xsl:if test="boolean(Relationships/Item[@type='RelationshipType'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="5">
								                <b>RelationshipTypes</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Relationship Name</th>
							              <th>Label</th>
							              <th>Related Item</th>
							              <th>Description</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='RelationshipType']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Views -->
				        <xsl:if test="boolean(Relationships/Item[@type='View'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="5">
								                <b>Views</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Form Name</th>
							              <th>Description</th>
							              <th>Identity</th>
							              <th>Type</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='View']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Server Events -->
				        <xsl:if test="boolean(Relationships/Item[@type='Server Event'][not(starts-with(related_id/@keyed_name,'polymorphic_item_'))])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="5">
								                <b>Server Events</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Method Name</th>
							              <th>Event</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Server Event']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Item Actions -->
				        <xsl:if test="boolean(Relationships/Item[@type='Item Action'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="6">
								                <b>Actions</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Name</th>
							              <th>Type</th>
							              <th>Location</th>
							              <th>Method</th>
							              <th>Target</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Item Action']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Workflows -->
				        <xsl:if test="boolean(Relationships/Item[@type='Allowed Workflow'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="6">
								                <b>Workflows</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Workflow Map Name</th>
							              <th>Description</th>
							              <th>Process Owner</th>
							              <th>Default</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Allowed Workflow']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- TOC Access -->
				        <xsl:if test="boolean(Relationships/Item[@type='TOC Access'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="6">
								                <b>TOC Access</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Identity</th>
							              <th>Category</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='TOC Access']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- TOC Views -->
				        <xsl:if test="boolean(Relationships/Item[@type='TOC View'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="6">
								                <b>TOC Views</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Identity</th>
							              <th>Start Page</th>
							              <th>Parameters</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='TOC View']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Client Events -->
				        <xsl:if test="boolean(Relationships/Item[@type='Client Event'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="5">
								                <b>Client Events</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Method Name</th>
							              <th>Event</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Client Event']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Can Add -->
				        <xsl:if test="boolean(Relationships/Item[@type='Can Add'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="5">
								                <b>Can Add</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Identity</th>
							              <th>Can Add</th>
							<th>Class Path</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Can Add']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Permissions -->
				        <xsl:if test="boolean(Relationships/Item[@type='Allowed Permission'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="5">
								                <b>Permissions</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Identity</th>
							              <th>Default</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Allowed Permission']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Reports -->
				        <xsl:if test="boolean(Relationships/Item[@type='Item Report'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="7">
								                <b>Reports</b>
							              </td>
						            </tr>
						            <tr>
							              <th>Name</th>
							              <th>Description</th>
							              <th>Type</th>
							              <th>Target</th>
							              <th>Method</th>
							              <th>Location</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Item Report']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
				    <!-- Morphae -->
				        <xsl:if test="boolean(Relationships/Item[@type='Morphae'])">
					          <table class="border">
						            <tr>
							              <td class="section" colspan="3">
								                <b>PolyMorphic Sources</b>
							              </td>
						            </tr>
						            <tr>
							              <th>ItemType Name</th>
							              <th>Description</th>
						      </tr>
						            <xsl:apply-templates select="Relationships/Item[@type='Morphae']">
							              <xsl:sort select="sort_order" data-type="number"/>
						      </xsl:apply-templates>
					     </table>
				    </xsl:if>
			    </body>
		    </html>
	  </xsl:template>
	  <xsl:template match="Item[@type='Property']">
		    <tr>
			      <td class="value">
				        <xsl:value-of select="name"/>
			      </td>
			      <td class="value">
				        <xsl:value-of select="label"/>
			      </td>
			      <td class="value" style="text-transform:capitalize;">
				        <xsl:value-of select="data_type"/>
				        <xsl:text> </xsl:text>
				        <xsl:choose>
					          <xsl:when test="data_type='string'">
						(
						            <xsl:value-of select="stored_length"/>
					          )</xsl:when>
					          <xsl:when test="data_type='item'">
						(
						            <xsl:value-of select="data_source/@keyed_name"/>
					          )</xsl:when>
					          <xsl:when test="data_type='list'">
						(
						            <xsl:value-of select="data_source/@keyed_name"/>
					          )</xsl:when>
					          <xsl:when test="data_type='sequence'">
						(
						            <xsl:value-of select="data_source/@keyed_name"/>
					          )</xsl:when>
					          <xsl:when test="(data_type='decimal' or data_type='float') and prec!=''">
						(
						            <xsl:value-of select="prec"/>
						.
						            <xsl:value-of select="scale"/>
					          )</xsl:when>
				       </xsl:choose>
			     </td>
			      <td class="value">
				        <xsl:if test="is_required='1'">
					Required
					          <br/>
				        </xsl:if>
				        <xsl:if test="is_unique='1'">
					Unique
					          <br/>
				        </xsl:if>
				        <xsl:if test="is_indexed='1'">
					Indexed
					          <br/>
				        </xsl:if>
			     </td>
			      <td class="value" style="text-align:center;">
				        <xsl:if test="is_hidden='1'">X</xsl:if>
			      </td>
			      <td class="value" style="text-align:center;">
				        <xsl:if test="is_hidden2='1'">X</xsl:if>
			      </td>
			      <td class="value" style="text-transform:capitalize; text-align:center;">
				        <xsl:value-of select="column_alignment"/>
			      </td>
			      <td class="value" style="text-align:right;">
				        <xsl:value-of select="column_width"/>
			      </td>
			      <td class="value" style="text-align:right;">
				        <xsl:value-of select="sort_order"/>
			      </td>
			      <td class="value">
				        <xsl:if test="keyed_name_order!=''">
					Keyed Name Order:          <xsl:value-of select="keyed_name_order"/>
					          <br/>
				        </xsl:if>
				        <xsl:if test="order_by!=''">
					Order By:          <xsl:value-of select="order_by"/>
					          <br/>
				        </xsl:if>
				        <xsl:if test="default_value!=''">
					Default Value:          <xsl:value-of select="default_value"/>
					          <br/>
				        </xsl:if>
				        <xsl:if test="default_search!=''">
					Default Search:          <xsl:value-of select="default_search"/>
					          <br/>
				        </xsl:if>
				        <xsl:if test="pattern!=''">
					Pattern:          <xsl:value-of select="pattern"/>
					          <br/>
				        </xsl:if>
				        <xsl:if test="class_path!='' and class_path!=concat('/',../../name)">
					Class:          <xsl:value-of select="substring-after(substring-after(class_path,'/'),'/')"/>
					          <br/>
				        </xsl:if>
				        <xsl:if test="foreign_property!=''">
					Pattern:          <xsl:value-of select="foreign_property/@keyed_name"/>
					          <br/>
				        </xsl:if>
				        <xsl:if test="help_tooltip!=''">
					Tooltip:          <xsl:value-of select="help_tooltip"/>
					          <br/>
				        </xsl:if>
			     </td>
			      <td class="value">
				        <xsl:value-of select="help_text"/>
			      </td>
		    </tr>
	  </xsl:template>
	  <!-- Removes system properties that have not been modified -->
	  <xsl:template match="Item[@type='Property'][name='behavior'][string(label)=''][string(data_type)='list'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='classification'][string(label)='Classification'][string(data_type)='string'][string(stored_length)='512'][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='classification'][string(label)=''][string(data_type)='string'][string(stored_length)='512'][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='config_id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='created_by_id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='created_on'][string(label)=''][string(data_type)='date'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='css'][string(label)=''][string(data_type)='text'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='current_state'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='effective_date'][../../is_versionable='1'][string(label)='Effective Date'][string(data_type)='date'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='generation'][string(label)=''][string(data_type)='integer'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='is_current'][string(label)=''][string(data_type)='boolean'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='is_released'][string(label)='Released'][string(data_type)='boolean'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='is_released'][string(label)=''][string(data_type)='boolean'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='itemtype'][../../implementation_type='polymorphic'][string(label)='ItemType'][string(data_type)='list'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='0'][string(is_hidden2)='0']"/>
	  <xsl:template match="Item[@type='Property'][name='keyed_name'][string(label)=''][string(data_type)='string'][string(stored_length)='128'][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='locked_by_id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='major_rev'][string(label)=''][string(data_type)='string'][string(stored_length)='8'][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='managed_by_id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='minor_rev'][string(label)=''][string(data_type)='string'][string(stored_length)='8'][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='modified_by_id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='modified_on'][string(label)=''][string(data_type)='date'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='new_version'][string(label)=''][string(data_type)='boolean'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='not_lockable'][string(label)='Not Lockable'][string(data_type)='boolean'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='not_lockable'][string(label)=''][string(data_type)='boolean'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='owned_by_id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='permission_id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='release_date'][../../is_versionable='1'][string(label)='Release Date'][string(data_type)='date'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='sort_order'][string(label)=''][string(data_type)='integer'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='state'][string(label)=''][string(data_type)='string'][string(stored_length)='32'][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='superseded_date'][../../is_versionable='1'][string(label)='Superseded Date'][string(data_type)='date'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='managed_by_id'][string(label)=''][string(data_type)='item'][string(stored_length)=''][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='team_id'][string(label)=''][string(data_type)='item'][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='Property'][name='team_id'][string(label)='Team'][string(data_type)='item'][string(column_alignment)='left'][string(is_hidden)='1'][string(is_hidden2)='1']"/>
	  <xsl:template match="Item[@type='RelationshipType']">
		    <tr>
			      <td class="value" width="25%">
				        <xsl:value-of select="name"/>
			      </td>
			      <td class="value" width="15%">
				        <xsl:value-of select="label"/>
			      </td>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="35%">
				        <xsl:value-of select="description"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="20%" rowspan="{count(../Item[@type='RelationshipType'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='View']">
		    <tr>
			      <td class="value" width="25%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="30%">
				        <xsl:value-of select="related_id/Item/description"/>
			      </td>
			      <td class="value" width="15%">
				        <xsl:value-of select="role/@keyed_name"/>
			      </td>
			      <td class="value" width="10%" style="text-transform:capitalize;">
				        <xsl:value-of select="type"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="40%" rowspan="{count(../Item[@type='View'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='Server Event']">
		    <tr>
			      <td class="value" width="20%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="15%">
				        <xsl:value-of select="server_event"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="50%" rowspan="{count(../Item[@type='Server Event'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <!-- Removes the polyitem server events -->
	  <xsl:template match="Item[@type='Server Event'][starts-with(related_id/@keyed_name,'polymorphic_item_')][../../implementation_type='polymorphic']"/>
	  <xsl:template match="Item[@type='Item Action']">
		    <tr>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="15%" style="text-transform:capitalize;">
				        <xsl:value-of select="related_id/Item/type"/>
			      </td>
			      <td class="value" width="15%" style="text-transform:capitalize;">
				        <xsl:value-of select="related_id/Item/location"/>
			      </td>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/Item/method/@keyed_name"/>
			      </td>
			      <td class="value" width="15%" style="text-transform:capitalize;">
				        <xsl:value-of select="related_id/Item/target"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="50%" rowspan="{count(../Item[@type='Item Action'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='Allowed Workflow']">
		    <tr>
			      <td class="value" width="20%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="25%">
				        <xsl:value-of select="related_id/Item/description"/>
			      </td>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/process_owner/@keyed_name"/>
			      </td>
			      <td class="value" width="10%">
				        <xsl:choose>
					          <xsl:when test="is_default='1'">Yes</xsl:when>
					          <xsl:otherwise>No</xsl:otherwise>
				      </xsl:choose>
			     </td>
			      <xsl:if test="position()=1">
				        <td width="30%" rowspan="{count(../Item[@type='Allowed Workflow'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='TOC Access']">
		    <tr>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="15%">
				        <xsl:value-of select="category"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="70%" rowspan="{count(../Item[@type='TOC Access'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='TOC View']">
		    <tr>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="25%">
				        <xsl:value-of select="start_page"/>
			      </td>
			      <td class="value" width="25%">
				        <xsl:value-of select="parameters"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="35%" rowspan="{count(../Item[@type='TOC View'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='Client Event']">
		    <tr>
			      <td class="value" width="20%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="15%">
				        <xsl:value-of select="client_event"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="50%" rowspan="{count(../Item[@type='Client Event'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='Can Add']">
		    <tr>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="10%">
				        <xsl:choose>
					          <xsl:when test="can_add='1'">Yes</xsl:when>
					          <xsl:otherwise>No</xsl:otherwise>
				      </xsl:choose>
			     </td>
			 <td class="value" width="20%">
				        <xsl:value-of select="class_path"/>
			 </td>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='Allowed Permission']">
		    <tr>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="10%">
				        <xsl:choose>
					          <xsl:when test="is_default='1'">Yes</xsl:when>
					          <xsl:otherwise>No</xsl:otherwise>
				      </xsl:choose>
			     </td>
			      <xsl:if test="position()=1">
				        <td width="75%" rowspan="{count(../Item[@type='Allowed Permission'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='Item Report']">
		    <tr>
			      <td class="value" width="20%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="25%">
				        <xsl:value-of select="related_id/Item/description"/>
			      </td>
			      <td class="value" width="10%" style="text-transform:capitalize;">
				        <xsl:value-of select="related_id/Item/type"/>
			      </td>
			      <td class="value" width="10%" style="text-transform:capitalize;">
				        <xsl:value-of select="related_id/Item/target"/>
			      </td>
			      <td class="value" width="20%">
				        <xsl:value-of select="related_id/Item/method/@keyed_name"/>
			      </td>
			      <td class="value" width="10%" style="text-transform:capitalize;">
				        <xsl:value-of select="related_id/Item/location"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="5%" rowspan="{count(../Item[@type='Item Report'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="Item[@type='Morphae']">
		    <tr>
			      <td class="value" width="15%">
				        <xsl:value-of select="related_id/@keyed_name"/>
			      </td>
			      <td class="value" width="20%">
				        <xsl:value-of select="related_id/description"/>
			      </td>
			      <xsl:if test="position()=1">
				        <td width="75%" rowspan="{count(../Item[@type='Morphae'])}"/>
			      </xsl:if>
		    </tr>
	  </xsl:template>
	  <xsl:template match="class">
		    <xsl:variable name="level">
			      <xsl:value-of select="count(ancestor::class)"/>
		    </xsl:variable>
		    <xsl:variable name="spacers">
			      <xsl:text>..............................</xsl:text>
		    </xsl:variable>
		    <xsl:value-of select="substring($spacers,1,$level*2)"/>
		    <xsl:value-of select="@name"/>
		    <br/>
		    <xsl:apply-templates select="class"/>
	  </xsl:template>
	  <xsl:template name="strip-path">
		    <xsl:param name="input"/>
		   <xsl:choose>
			      <xsl:when test="not(contains($input,'/'))">
				        <xsl:value-of select="$input"/>
			      </xsl:when>
			    <xsl:otherwise>
				     <xsl:call-template name="strip-path">
					          <xsl:with-param name="input" select="substring-after($input,'/')"/>
				     </xsl:call-template>
			    </xsl:otherwise>
		   </xsl:choose>
	  </xsl:template>
</xsl:stylesheet>