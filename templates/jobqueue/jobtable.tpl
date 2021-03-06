<table class="table table-striped">
    <thead>
    <tr>
        <th class="text-nowrap">Job ID</th>
        <th>Task</th>
        <th>Trigger user</th>
        <th>Request</th>
        <th>Status</th>
        <th>Enqueue time</th>
        <th>Error Message</th>
        <th>Acknowledged</th>
    </tr>
    </thead>
    <tbody>
    {foreach from=$joblist item="job"}
        <tr>
            <td class="table-button-cell">
                <a class="btn btn-secondary btn-sm" href="{$baseurl}/internal.php/jobQueue/view?id={$job->getId()|escape}">
                    <i class="fas fa-search"></i> Job {$job->getId()|escape}
                </a>
            </td>
            <td>
                {if isset($taskNameMap[$job->getTask()])}
                    {$taskNameMap[$job->getTask()]|escape}
                {else}
                    {$job->getTask()|escape}
                {/if}
            </td>
            <td>
                <a href="{$baseurl}/internal.php/statistics/users/detail?user={$job->getTriggerUserId()}">
                    {$users[$job->getTriggerUserId()]|escape}
                </a>
            </td>
            <td>
                <a href="{$baseurl}/internal.php/viewRequest?id={$job->getRequest()|escape}">
                    #{$job->getRequest()|escape} ({$requests[$job->getRequest()]|escape})
                </a>
            </td>
            <td>
                <span rel="tooltip" title="{$statusDescriptionMap[$job->getStatus()]|escape}"
                   data-toggle="tooltip" id="#status{$job->getId()|escape}">{$job->getStatus()|escape}</span>
            </td>
            <td>
                <span rel="tooltip" title="{$job->getEnqueue()|relativedate}"
                   data-toggle="tooltip" id="#enqueue{$job->getId()|escape}">{$job->getEnqueue()|escape}</span>
            </td>
            <td>{$job->getError()|escape}</td>
            <td>
                {if $job->getAcknowledged() === null}
                    N/A
                {elseif $job->getAcknowledged() == 1}
                    Yes
                {elseif $job->getAcknowledged() == 0}
                    No
                {/if}
            </td>
        </tr>
    {/foreach}
    </tbody>
</table>
