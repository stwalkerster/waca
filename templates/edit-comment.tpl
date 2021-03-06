{extends file="pagebase.tpl"}
{block name="content"}
    <div class="row">
        <div class="col-12">
            <h2>Edit comment #{$comment->getId()}</h2>
        </div>
    </div>

    <form method="post">
        {include file="security/csrf.tpl"}

        <div class="form-group row">
            <div class="col-md-4 col-lg-2">
                <label class="col-form-label" for="request">Request</label>
            </div>
            <div class="col-md-8 col-lg-4">
                <a class="form-control" id="request" href="{$baseurl}/internal.php/viewRequest?id={$comment->getRequest()}">{$request->getName()|escape}</a>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-4 col-lg-2">
                <label class="col-form-label" for="user">Commenting user</label>
            </div>
            <div class="col-md-8 col-lg-4">
                <a class="form-control" id="user" href="{$baseurl}/internal.php/statistics/users/detail?user={$comment->getUser()}">{$user->getUsername()|escape}</a>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-4 col-lg-2">
                <label class="col-form-label" for="timestamp">Timestamp</label>
            </div>
            <div class="col-md-8 col-lg-4">
                <div class="form-control" id="timestamp">{$comment->getTime()|date}</div>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-4 col-lg-2">
                <label class="col-form-label" for="visibility">Security</label>
            </div>
            <div class="col-md-8 col-lg-4">
                <select name="visibility" class="form-control" id="visibility">
                    <option value="user" {if $comment->getVisibility() == "user"}selected{/if}>Standard</option>
                    <option value="admin" {if $comment->getVisibility() == "admin"}selected{/if}>Restricted</option>
                </select>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-4 col-lg-2">
                <label class="col-form-label" for="oldtext">Old text</label>
            </div>
            <div class="col-md-8 col-lg-10">
                <pre class="form-control prewrap" id="oldtext">{$comment->getComment()|escape}</pre>
            </div>
        </div>

        <div class="form-group row">
            <div class="col-md-4 col-lg-2">
                <label class="col-form-label" for="newcomment">New text</label>
            </div>
            <div class="col-md-8 col-lg-10">
                <textarea class="form-control" rows="4" name="newcomment" id="newcomment">{$comment->getComment()|escape}</textarea>
            </div>
        </div>

        <input type="hidden" name="updateversion" value="{$comment->getUpdateVersion()}"/>

        <div class="form-group row">
            <div class="offset-md-4 offset-lg-2 col-md-4">
                <button type="submit" class="btn btn-block btn-primary">Save changes</button>
            </div>
        </div>

    </form>
{/block}
