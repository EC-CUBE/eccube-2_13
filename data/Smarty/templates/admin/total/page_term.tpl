<!--{*
/*
 * This file is part of EC-CUBE
 *
 * Copyright(c) EC-CUBE CO.,LTD. All Rights Reserved.
 *
 * http://www.ec-cube.co.jp/
 *
 * This program is free software; you can redistribute it and/or
 * modify it under the terms of the GNU General Public License
 * as published by the Free Software Foundation; either version 2
 * of the License, or (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
 */
*}-->
<div style="margin:20px 10px; padding:0; width:100%; height:350px;" id="graphField">Now Loading ...</div>
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>

<script type="text/javascript">
  google.charts.load('current', {'packages':['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {

    var data = data = google.visualization.arrayToDataTable([

      ['日付', '合計'],
      <!--{foreach from=$arrResults key="key" item="item" name="line"}-->
      <!--{if !$smarty.foreach.line.last}-->
      [
        <!--{if $smarty.post.type == "year" || $smarty.post.type == "wday" || $smarty.post.type == "hour"}-->
        "<!--{$item.str_date}-->",
        <!--{else}-->
        new Date(<!--{$item.str_date|date_format:'%Y'}-->, <!--{$item.str_date|date_format:'%m'-1}-->, <!--{$item.str_date|date_format:'%d'}-->),
        <!--{/if}-->
      <!--{$item.total|default:0}-->
      ],
      <!--{/if}-->
      <!--{/foreach }-->
    ]);
    var options = {
      hAxis: { title:'日付', titleTextStyle:{italic:false} },
      vAxis: { title:'売上',  titleTextStyle:{italic:false} },
      crosshair: { trigger: 'both' }
    };
    var chart = new google.visualization.LineChart(document.getElementById('graphField'));

    chart.draw(data, options);
  }
</script>

<table id="total-term" class="list">
    <tr>
        <th>期間</th>
        <th>購入件数</th>
        <th>男性</th>
        <th>女性</th>
        <th>男性(会員)</th>
        <th>男性<br />(非会員)</th>
        <th>女性(会員)</th>
        <th>女性<br />(非会員)</th>
        <th>購入合計</th>
        <th>購入平均</th>
    </tr>

    <!--{section name=cnt loop=$arrResults}-->
        <!--{* 色分け判定 *}-->
        <!--{if !$smarty.section.cnt.last}-->
            <!--{assign var=type value="`$smarty.section.cnt.index%2`"}-->
            <!--{if $type == 0}-->
                <!--{* 偶数行 *}-->
                <!--{assign var=color value="even"}-->
            <!--{else}-->
                <!--{* 奇数行 *}-->
                <!--{assign var=color value="odd"}-->
            <!--{/if}-->
        <!--{else}-->
            <!--{* 最終行 *}-->
            <!--{assign var=color value="last"}-->
        <!--{/if}-->

        <tr class="<!--{$color}-->">
            <!--{assign var=wday value="`$arrResults[cnt].wday`"}-->

            <!--{if !$smarty.section.cnt.last}-->
                <td class="center"><!--{*期間*}--><!--{$arrResults[cnt].str_date}--></td>
            <!--{else}-->
                <td class="center"><!--{*期間*}-->合計</td>
            <!--{/if}-->

            <td class="right"><!--{*購入件数*}--><!--{$arrResults[cnt].total_order|n2s}-->件</td>
            <td class="right"><!--{*男性*}--><!--{$arrResults[cnt].men|n2s}--></td>
            <td class="right"><!--{*女性*}--><!--{$arrResults[cnt].women|n2s}--></td>
            <td class="right"><!--{*男性(会員)*}--><!--{$arrResults[cnt].men_member|n2s}--></td>
            <td class="right"><!--{*男性(非会員)*}--><!--{$arrResults[cnt].men_nonmember|n2s}--></td>
            <td class="right"><!--{*女性(会員)*}--><!--{$arrResults[cnt].women_member|n2s}--></td>
            <td class="right"><!--{*女性(非会員)*}--><!--{$arrResults[cnt].women_nonmember|n2s}--></td>
            <td class="right"><!--{*購入合計*}--><!--{$arrResults[cnt].total|n2s}-->円</td>
            <td class="right"><!--{*購入平均*}--><!--{$arrResults[cnt].total_average|n2s}-->円</td>
        </tr>
    <!--{/section}-->

    <tr>
        <th>期間</th>
        <th>購入件数</th>
        <th>男性</th>
        <th>女性</th>
        <th>男性(会員)</th>
        <th>男性<br />(非会員)</th>
        <th>女性(会員)</th>
        <th>女性<br />(非会員)</th>
        <th>購入合計</th>
        <th>購入平均</th>
    </tr>
</table>
