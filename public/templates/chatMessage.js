define(function(){return function anonymous(locals,attrs,escape,rethrow,merge){attrs=attrs||jade.attrs,escape=escape||jade.escape,rethrow=rethrow||jade.rethrow,merge=merge||jade.merge;var buf=[];with(locals||{}){var interp;username?buf.push('<p class="msg"><strong>'+escape((interp=username)==null?"":interp)+"</strong><span>"+escape((interp=message)==null?"":interp)+"</span></p>"):buf.push('<p class="msg"><span class="msg">'+escape((interp=message)==null?"":interp)+"</span></p>")}return buf.join("")}})