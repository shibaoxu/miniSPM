<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<div class="row">
    <div>
        <h2 class="text-center">销售机会管理相关说明</h2>
        <h5 class="text-center">过程决定结果，细节决定成败</h5>
    </div>
    <h3>目的</h3>
    <ul>
        <li>销售信息透明化，便于跟踪及协调</li>
        <li>展现销售人员做了什么，好的结果固然体现能力，好的过程同样也体现能力</li>
    </ul>

    <h3>范围</h3>

    <p>
        TID所有担负销售职责的人员
    </p>

    <h3>总体描述</h3>
    目前系统主要管理两项内容，分别是市场活动和销售线索；
    <h4>市场活动</h4>

    <p>
        在没有形成明确销售线索之前的活动都属于销售活动。例如，老客户的例行拜访，新客户的首次拜访，举办市场活动，电话访谈等等活动。正是通过这些活动我们才能得到初级的销售线索；
    </p>
    <h4>销售线索</h4>

    <p>
        在销售管理体系中销售线索处于客户产生机会的最前端，一般由通过市场活动获得销售的初级线索，销售人员在持续跟进和推动线索的继续延伸，到达成熟阶段后销售线索转换为销售机会；
        一旦确定销售线索，则和此销售相关的所有销售活动及信息都需要和其关联；重大进展需要明确标示；
        当销售线索发展到一定阶段，签约可能性达到50%及以上之后，需要转化成销售机会；
    </p>
    <h4>销售机会</h4>

    <p>
        一旦销售线索转化成销售机会就需要估算签约计划及合同金额。销售机会相关管理目前系统内还没有包括。
    </p>

    <h3>权限设定</h3>

    <p>
    <ul>
        <li>客户经理，只能查看、修改自己的市场活动及销售线索</li>
        <li>行业总监，可以查看本行业的所有市场活动及销售线索，但只能修改自己的市场活动及销售线索</li>
        <li>部门经理，可以查看本部门及所属行业或下级部门的所有市场活动及销售线索，但但只能修改自己的市场活动及销售线索</li>
        <li>事业部总经理，可以查看本事业部所有市场活动及销售线索，但但只能修改自己的市场活动及销售线索</li>
    </ul>
    </p>
    <h3>使用说明</h3>
    <h4>市场活动</h4>
    <img class="img-responsive" src="${ctx}/static/images/introduce/market_action_list.png">

    <p>
        进入市场活动页面后，根据权限每个人可以看到系统允许看到的市场活动。
    </p>

    <p>
        点击简述超链接可以查看市场活动的详情，但不能修改。如果要修改自己的市场活动则必须在“操作”中点击“修改”
    </p>

    <img class="img-responsive" src="${ctx}/static/images/introduce/market_action.png">

    <p>
        在录入市场活动时以下几点需要注意：
    <ul>
        <li><strong>活动类型:</strong>活动的类型根据实际情况选择</li>
        <li><strong>简述:</strong>必须言简意赅，需要包含客户名称、交流对象及事项</li>
        <li><strong>所有者:</strong>默认是当前登录用户，非特殊情况勿修改，涉及权限控制</li>
        <li><strong>部门:</strong>默认为当前用户所处部门，此处的部门和公司组织架构并不一致，非特殊情况勿更改，涉及权限控制</li>
        <li>如是重要市场活动，例如对事业部或部门整体上有影响，可标记为重要，此类市场活动会在列表中以不同颜色显示</li>
        <li>
            <strong>详情:</strong>尽可能详细的记录过程及结论。常见要素包括<strong>参入人</strong>，<strong>议题</strong>，<strong>结论</strong>，<strong>后续工作等</strong>
        </li>
    </ul>
    </p>
    <h4>销售线索</h4>
    <img class="img-responsive" src="${ctx}/static/images/introduce/leads.png">

    <p>
        销售线索是指我们有机会签约的销售机会，但签约几率还不确定或者还不是很高，需要进一步跟踪。增加销售线索是需要填写一下基本信息：
    <ul>
        <li><strong>名称:</strong>简明扼要的进行描述，通常包括客户名称及商务线索描述</li>
        <li><strong>客户:</strong>根据实际情况进行选择</li>
        <li><strong>来源:</strong>有可能我们会从多种渠道得到销售线索，例如老项目延续，客户介绍，公司市场部介绍，兄弟部门介绍等等，更具实际情况选择。</li>
        <li><strong>所有者:</strong>默认是当前登录用户，非特殊情况勿修改，涉及权限控制</li>
        <li><strong>部门:</strong>默认为当前用户所处部门，此处的部门和公司组织架构并不一致，非特殊情况勿更改，涉及权限控制</li>
        <li><strong>预测价格:</strong>估计此销售线索的成交价格，分为下限值和上限值</li>
        <li><strong>成交价:</strong>最终成交价，此字段在签约后确定</li>
        <li><strong>详情:</strong>尽可能详细描述此销售线索，包括背景，主要需要，涉及部门，主要干系人等信息</li>

    </ul>
    </p>
    <h4>销售线索跟踪</h4>
    <img class="img-responsive" src="${ctx}/static/images/introduce/leads_list.png">

    <p>
        在上面的销售线索列表界面，点击“最近活动”的超链接或者点击“操作->查看“销售活动，就会进入到和此销售线索相关联的销售活动列表页面。如下图：
    </p>
    <img class="img-responsive" src="${ctx}/static/images/introduce/action_list.png">

    <p>
        在以上页面中可以看到所有和此销售线索相关的销售活动，也可以增加销售活动。销售活动包括各种和此销售线索相关的事项，包括售前，电话沟通等等内容。以不同颜色标示
        的是重要的或里程碑的销售活动，例如：售前交流，商务谈判，招投标，或者其他推动项目进展的活动或消息；销售活动的详细信息如下：
    </p>
    <img class="img-responsive" src="${ctx}/static/images/introduce/action.png">

    <p>
    <ul>
        <li><strong>活动类型:</strong>根据实际情况进行选择</li>
        <li><strong>简述:</strong>简明扼要进行说明</li>
        <li><strong>时间:</strong>根据实际情况进行选择</li>
        <li><strong>客户参入者，我方参入者:</strong>根据实际情况进行填写</li>
        <li>重要的进展需要标记为里程碑事件</li>
        <li><strong>详情:</strong>尽可能详细的描述此次活动的内容及后续安排</li>
    </ul>
    </p>

    <h4>后续路线图</h4>

    <p>
    <ul>
        <li>对进入系统的销售线索进行统计并和年初预算进行对比</li>
        <li>对销售人员的活跃度进行统计排名</li>
        <li>对销售线索的活跃度进行统计排名</li>
        <li>增加销售机会管理功能，主要针对签约计划</li>
    </ul>
    </p>


</div>
<script type="text/javascript">
    require(['bootstrap'], function () {
        ;
    });
</script>